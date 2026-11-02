Config = {}

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true'
Config.MinimumJobGrade = 6 -- Truck Driver and higher
Config.FuelResource = 'lc_fuel' -- Resource providing SetFuel(vehicle, level)

Config.TruckerJobTruckDeposit = 125
Config.TruckerJobFixedLocation = false
Config.TruckerJobMaxDrops = 20 -- amount of locations before being forced to return to station to reload
Config.TruckerJobDropPrice = 500
Config.TruckerJobBonus = 20 -- this is a percentage to calculate bonus over 5 deliveries.
Config.TruckerJobPaymentTax = 15

Config.TruckerJobLocations = {
    ["main"] = {
        label = "Truck Shed",
        coords = vector4(153.68, -3211.88, 5.91, 274.5),
    },
    ["vehicle"] = {
        label = "Truck Storage",
        coords = vector4(141.12, -3204.31, 5.85, 267.5),
    },
}

Config.TruckerJobVehicles = {
    ["rumpo"] = {
        ["label"] = "Rumpo Delivery Van",
        ["cargodoors"] = {
            [0] = 2,
            [1] = 3
        },
        ["trunkpos"] = 1.5,
        ["livery"] = 1, -- Set to false to leave unchanged
        ["colors"] = { primary = 122, secondary = 122 }, -- Set to false to leave unchanged
        ["extras"] = {}, -- e.g. [1] = true, [2] = false; unspecified extras are untouched
        ["fuel"] = 100.0
    },
    ["benson"] = {
        ["label"] = "Benson Box Truck",
        ["jobrep"] = 0,
        ["cargodoors"] = {
            [0] = 5
        },
        ["trunkpos"] = 3,
        ["livery"] = 1, -- Set to false to leave unchanged
        ["colors"] = { primary = 122, secondary = 122 }, -- Set to false to leave unchanged
        ["extras"] = {}, -- e.g. [1] = true, [2] = false; unspecified extras are untouched
        ["fuel"] = 100.0
    },
    ["mule6"] = {
        ["label"] = "Mule Box Truck",
        ["jobrep"] = 0,
        ["cargodoors"] = {
            [0] = 2,
            [1] = 3
        },
        ["trunkpos"] = 1.5,
        ["livery"] = 1, -- Set to false to leave unchanged
        ["colors"] = { primary = 122, secondary = 122 }, -- Set to false to leave unchanged
        ["extras"] = {}, -- e.g. [1] = true, [2] = false; unspecified extras are untouched
        ["fuel"] = 100.0
    },
    ["pounder"] = {
        ["label"] = "Pounder Box Truck",
        ["jobrep"] = 0,
        ["cargodoors"] = {
            [0] = 2,
            [1] = 3
        },
        ["trunkpos"] = 7,
        ["livery"] = 1, -- Set to false to leave unchanged
        ["colors"] = { primary = 122, secondary = 122 }, -- Set to false to leave unchanged
        ["extras"] = {}, -- e.g. [1] = true, [2] = false; unspecified extras are untouched
        ["fuel"] = 100.0
    },
    ["boxville4"] = {
        ["label"] = "Boxville StepVan",
        ["jobrep"] = 0,
        ["cargodoors"] = {
            [0] = 2,
            [1] = 3
        },
        ["trunkpos"] = 1.5,
        ["livery"] = 1, -- Set to false to leave unchanged
        ["colors"] = { primary = 122, secondary = 122 }, -- Set to false to leave unchanged
        ["extras"] = {}, -- e.g. [1] = true, [2] = false; unspecified extras are untouched
        ["fuel"] = 100.0
    },
}