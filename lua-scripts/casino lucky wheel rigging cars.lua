local root = menu.root()

local selected_prize = 18

root:button("Force Luckywheel Outcome"):tooltip("LOAD THIS BEFORE PRESSING S"):event(menu.event.click, function()

    local playerIndex = players.me().id 
    local source_offset = 142 + (playerIndex * 5)
    
    script.locals("casino_lucky_wheel", source_offset).int32 = selected_prize

    script.locals("casino_lucky_wheel", 302 + 14).int32 = selected_prize

    script.locals("casino_lucky_wheel", 302 + 10).int32 = selected_prize
end)


root:button("Enable Unlimited Spins"):tooltip("USE AT YOUR OWN RISK"):event(menu.event.click, function()

    script.globals(262145 + 26765).int32 = 99
    script.globals(262145 + 26766).int32 = 99
    script.globals(262145 + 37367).int32 = 99
end)


local mystery_vehicle_list = {
    { "Lost Slamvan", 833469436 },
    { "Deluxo", 1483171323 },
    { "Turismo R", 408192225 },
    { "Infernus Classic", -1405937764 },
    { "Oppressor", 884483972 },
    { "JB 700", 1051415893 },
    { "Cheetah", -1311154784 },
    { "Entity XF", -1291952903 },
    { "Banshee", -1041692462 },
    { "Furore GT", -1089039904 },
    { "Ruston", 719660200 },
    { "Verlierer", -827659972 },
    { "Schafter V12", -1485523546 },
    { "Jester", -1106353882 },
    { "Massacro", -631760477 },
    { "Burger Shot Stallion", -401643538 },
    { "Pisswasser Dominator", -915704871 },
    { "Redwood Gauntlet", 349315417 },
    { "Tornado Rat Rod", -1558399629 }, 
    { "Hotknife", 37348240 },
    { "Slamvan", 729783779 },
    { "Kamacho", -121446169 },
    { "Toros", -1168952148 },
    { "Bifta", 353883353 },
    { "Kalahari", 92612664 }, 
    { "Faggio Sport", -827204232 }
}


local selected_mystery_hash = -897824023 


local veh_combo = root:combo_int("Select Mystery Vehicle", mystery_vehicle_list, 1)

veh_combo:event(0, function(item)
    local index = item.value
    if mystery_vehicle_list[index] then
        selected_mystery_hash = mystery_vehicle_list[index][2]
    end
end)

root:button("Rig Mystery to Selected Vehicle"):event(0, function()
  
    local playerIndex = players.me().id 
    local source_offset = 142 + (playerIndex * 5)

    script.locals("casino_lucky_wheel", source_offset).int32 = 11      
    script.locals("casino_lucky_wheel", 302 + 14).int32 = 11           
    script.locals("casino_lucky_wheel", 302 + 10).int32 = 11           


    local main_flag_addr = script.locals("casino_lucky_wheel", 302)
    main_flag_addr.int32 = main_flag_addr.int32 | 524288 

    script.locals("casino_lucky_wheel", 302 + 47).int32 = 1 


    local veh_flag_addr = script.locals("casino_lucky_wheel", 302 + 74 + 61)
    veh_flag_addr.int32 = veh_flag_addr.int32 | 1

    script.locals("casino_lucky_wheel", 302 + 74 + 66).int32 = selected_mystery_hash
end)
