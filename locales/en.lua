local Translations = {
    error = {
        no_deposit = "$%{value} refundable vehicle checkout deposit required",
        loading_queue = "Your next truck is being loaded. Approximately %{minutes} minute(s) remaining.",
        tax_transfer = "Delivery payout pending: government tax transfer unavailable. Please try again.",
        cancelled = "Cancelled",
        vehicle_not_correct = "This is not a commercial vehicle!",
        no_driver = "You must be the driver to do this..",
        no_work_done = "You haven't done any work yet..",
        backdoors_not_open = "The backdoors of the vehicle aren't open",
        get_out_vehicle = "You need to step out of the vehicle to perform this action",
        too_far_from_trunk = "You need to grab the boxes from the trunk of your vehicle",
        too_far_from_delivery = "You need to be closer to the delivery point"
    },
    success = {
        paid_with_cash = "$%{value} Deposit Paid With Cash",
        paid_with_bank = "$%{value} Deposit Paid From Bank",
        refund_to_cash = "$%{value} Deposit Returned",
        checkout_deposit = "$%{value} refundable vehicle checkout deposit received. Your truck is fueled and ready; return it for a full refund.",
        refund_to_bank = "Truck returned. Your full $%{value} vehicle checkout deposit was refunded to your bank.",
        loading_started = "Your next truck is being prepared. Check back in approximately %{minutes} minutes.",
        you_earned = "You Earned $%{value}",
        payslip_time = "You Went To All The Shops .. Time For Your Payslip!",
    },
    menu = {
        header = "Available Trucks",
        close_menu = "⬅ Close Menu",
    },
    mission = {
        store_reached = "Store reached, get a box in the trunk with [E] and deliver to marker",
        take_box = "Take A Box Of Products",
        deliver_box = "Deliver Box Of Products",
        another_box = "Get another Box Of Products",
        goto_next_point = "You Have Delivered All Products, To The Next Point",
        return_to_station = "You Have Delivered All Products, Return to Station",
        job_completed = "You Have Completed Your Route, Please Collect Your Pay Cheque"
    },
    info = {
        deliver_e = "~g~E~w~ - Deliver Products",
        deliver = "Deliver Products",
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
