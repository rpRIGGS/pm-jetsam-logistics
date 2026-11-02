local QBCore = exports['qb-core']:GetCoreObject()
local Bail = {}
local Routes = {}
local NextCheckout = {}

local function eligible(player)
    return player and player.PlayerData.job.name == 'jetsam'
        and (tonumber(player.PlayerData.job.grade and player.PlayerData.job.grade.level) or -1) >= Config.MinimumJobGrade
end

local function notify(src, key, values, kind)
    TriggerClientEvent('QBCore:Notify', src, Lang:t(key, values), kind or 'primary')
end

RegisterNetEvent('qb-trucker:server:DoBail', function(checkout, model)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    if not eligible(player) then return end
    local id = player.PlayerData.citizenid
    if checkout then
        if not Config.TruckerJobVehicles[model] or Bail[id] then return end
        local remaining = (NextCheckout[id] or 0) - os.time()
        if remaining > 0 then
            notify(src, 'error.loading_queue', { minutes = math.ceil(remaining / 60) }, 'error')
            return
        end
        local method = player.PlayerData.money.cash >= Config.TruckerJobTruckDeposit and 'cash'
            or player.PlayerData.money.bank >= Config.TruckerJobTruckDeposit and 'bank' or nil
        if not method then
            notify(src, 'error.no_deposit', { value = Config.TruckerJobTruckDeposit }, 'error')
            return
        end
        if not player.Functions.RemoveMoney(method, Config.TruckerJobTruckDeposit, 'jetsam-vehicle-checkout') then return end
        Bail[id] = Config.TruckerJobTruckDeposit
        Routes[id] = { drops = 0, active = true, lastLocation = nil }
        notify(src, 'success.checkout_deposit', { value = Config.TruckerJobTruckDeposit }, 'success')
        TriggerClientEvent('qb-trucker:client:SpawnVehicle', src, model)
    else
        if not Bail[id] then return end
        local depot = Config.TruckerJobLocations.vehicle.coords
        if #(GetEntityCoords(GetPlayerPed(src)) - vector3(depot.x, depot.y, depot.z)) > 30.0 then return end
        player.Functions.AddMoney('bank', Bail[id], 'jetsam-vehicle-return')
        Bail[id] = nil
        NextCheckout[id] = os.time() + Config.TruckerJobCooldown
        if Routes[id] then Routes[id].active = false end
        notify(src, 'success.refund_to_bank', { value = Config.TruckerJobTruckDeposit }, 'success')
        notify(src, 'success.loading_started', { minutes = math.ceil(Config.TruckerJobCooldown / 60) }, 'primary')
        SetTimeout(Config.TruckerJobCooldown * 1000, function()
            local current = QBCore.Functions.GetPlayer(src)
            if current and current.PlayerData.citizenid == id and not Bail[id] and os.time() >= (NextCheckout[id] or 0) then
                notify(src, 'success.loading_ready', {}, 'success')
            end
        end)
    end
end)

-- Only server-defined qb-shops delivery coordinates qualify for payment.
RegisterNetEvent('qb-trucker:server:CompleteDrop', function(shop)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    if not eligible(player) or type(shop) ~= 'string' then return end
    local route = Routes[player.PlayerData.citizenid]
    if not route or not route.active or route.drops >= Config.TruckerJobMaxDrops then return end
    route.completed = route.completed or {}
    if route.completed[shop] then return end
    local ok, stop = pcall(function() return exports['qb-shops']:GetDeliveryStop(shop) end)
    if not ok or not stop then return end
    if #(GetEntityCoords(GetPlayerPed(src)) - vector3(stop.x, stop.y, stop.z)) > 10.0 then return end
    local restocked, success = pcall(function() return exports['qb-shops']:RestockFromJetsam(shop) end)
    if not restocked or success ~= true then return end
    route.completed[shop] = true
    route.drops = route.drops + 1
end)

RegisterNetEvent('qb-trucker:server:01101110', function()
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    if not eligible(player) then return end
    local id = player.PlayerData.citizenid
    local route = Routes[id]
    if not route or route.active or route.drops < 1 then return end
    local depot = Config.TruckerJobLocations.main.coords
    if #(GetEntityCoords(GetPlayerPed(src)) - vector3(depot.x, depot.y, depot.z)) > 15.0 then return end
    local drops = route.drops
    local base = drops * Config.TruckerJobDropPrice
    local bonus = drops >= 5 and math.floor(base * Config.TruckerJobBonus / 100 + 0.5) or 0
    local gross = base + bonus
    local tax = math.floor(gross * Config.TruckerJobPaymentTax / 100 + 0.5)
    local payment = gross - tax
    -- Don't consume the route or pay out unless the government tax transfer succeeds.
    if tax > 0 then
        local ok, result = pcall(function()
            return exports['qb-banking']:AddMoney(Config.TruckerJobTaxAccount, tax, 'Jetsam delivery income tax')
        end)
        if not ok or result == false then
            print(('[qb-truckerjob] SAGOV tax transfer failed for %s: %s'):format(id, tostring(result)))
            notify(src, 'error.tax_transfer', {}, 'error')
            return
        end
    end
    Routes[id] = nil
    player.Functions.AddJobReputation(drops)
    player.Functions.AddMoney('bank', payment, 'jetsam-delivery-earnings')
    notify(src, 'success.you_earned', { value = payment }, 'success')
end)

RegisterNetEvent('qb-trucker:server:nano', function()
    -- Preserve the original optional reward, limited to authorized active drivers.
    local player = QBCore.Functions.GetPlayer(source)
    if not eligible(player) or not Routes[player.PlayerData.citizenid] or not Routes[player.PlayerData.citizenid].active then return end
    if math.random(1, 100) > 26 then return end
    player.Functions.AddItem('cryptostick', 1, false)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['cryptostick'], 'add')
end)
