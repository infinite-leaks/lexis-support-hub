-- HEIST TOOL SKIDDED FROM DECOMPILED SCRIPTS AND EVERYONE IN EXISTENCE

local function generate_list(min, max, step)
    local list = {}
    for i = min, max, step do
        table.insert(list, {tostring(i), i})
    end
    return list
end

local function generate_list_percent(min, max, step)
    local list = {}
    for i = min, max, step do
        table.insert(list, {i .. '%', i})
    end
    return list
end

local function find_index(list, value)
    if value == nil then return 1 end
    for i, v in ipairs(list) do
        if v[2] == value then
            return i
        end
    end
    return 1 
end


local list_step_1 = generate_list_percent(0, 1000, 1)
local list_step_2 = generate_list_percent(0, 1000, 2)
local list_step_5 = generate_list_percent(0, 1000, 5)
local list_step_20 = generate_list_percent(0, 1000, 20)
local list_step_25 = generate_list_percent(0, 1000, 25)
local list_salvage_sell = generate_list(0, 2100000, 10000)
local list_autoshop_payout = generate_list(0, 2200000, 100000)
local list_cayo_cash_val = generate_list(83250, 2550000, 50000)
local list_cayo_weed_val = generate_list(135000, 2550000, 50000)
local list_cayo_coke_val = generate_list(202500, 2550000, 50000)
local list_cayo_gold_val = generate_list(333333, 2550000, 50000)
local list_cayo_arts_val = generate_list(180000, 2550000, 50000)


local loggedSalvageSetup = false
local root = menu.root()

local heistToolMenu = root:submenu("Heist Tool")
local cayoMenu = heistToolMenu:submenu("Cayo Perico Heist")
local cayoprepsMenu = cayoMenu:submenu("Cayo Prep Options")
local cayoCutsMenu = cayoMenu:submenu("Cayo Heist Cuts")
local cayotoolsMenu = cayoMenu:submenu("Cayo Heist Tools")
local difficultyMenu = cayoprepsMenu:submenu("Difficulty")
local approachMenu = cayoprepsMenu:submenu("Approach")
local targetMenu = cayoprepsMenu:submenu("Primary Target")
local secondaryMenu = cayoprepsMenu:submenu("Compound Target")
local islandTargetMenu = cayoprepsMenu:submenu("Island Target")
local loadoutMenu = cayoprepsMenu:submenu("Weapon Loadout")
local LootOptionsMenu = cayoprepsMenu:submenu("Loot Options")
local compoundAmountMenu = LootOptionsMenu:submenu("Amount Compound Loot")
local islandAmountMenu = LootOptionsMenu:submenu("Amount Island Loot")
local artsAmountMenu = LootOptionsMenu:submenu("Art Amount Loot")
local agencyMenu = heistToolMenu:submenu("Agency")
local agencyPrepsMenu = agencyMenu:submenu("Agency Prep Options")
local autoshopHeistMenu = heistToolMenu:submenu("Auto Shop")
local autoshopPrepsMenu = autoshopHeistMenu:submenu("Auto Shop Prep Options")
local autoshopmoneyMenu = autoshopHeistMenu:submenu("Auto Shop Money Options")
local autoshopToolMenu = autoshopHeistMenu:submenu("Auto Shop Tools")
local autoshopcontractsmenu = autoshopPrepsMenu:submenu("Select Contract")
local salvageMenu = heistToolMenu:submenu("Salvage Yard")
local casinoHeistMenu = heistToolMenu:submenu("Casino Heist")
local doomsHeistMenu = heistToolMenu:submenu("Doomsday Heist")
local classicHeistMenu = heistToolMenu:submenu("Classic Heist")
local contractsMenu = agencyPrepsMenu:submenu("Contracts")
local agencyToolsMenu = agencyMenu:submenu("Agency Tools")
local salvagePrepsMenu = salvageMenu:submenu("Salvage Yard Prep Options")
local salvageToolsMenu = salvageMenu:submenu("Salvage Yard Tools")
local classicPrepsMenu = classicHeistMenu:submenu("Classic Heist Prep Options")
local classicCutsMenu = classicHeistMenu:submenu("Classic Heist Cuts")
local classicToolsMenu = classicHeistMenu:submenu("Classic Heist Tools")
local doomspresetMenu = doomsHeistMenu:submenu("Doomsday Prep Presets")
local doomsCutsMenu = doomsHeistMenu:submenu("Doomsday Cuts")
local doomsToolsMenu = doomsHeistMenu:submenu("Doomsday Heist Tools")
local doomscutspresetMenu = doomsCutsMenu:submenu("Automated Doomsday Payout")
local presetsMenu = casinoHeistMenu:submenu("Casino Prep Presets")
local cutsMenu = casinoHeistMenu:submenu("Casino Cuts")
local toolsMenu = casinoHeistMenu:submenu("Casino Tools")
local cluckinMenu = heistToolMenu:submenu("Cluckin Bell Farm Raid")
casinoHeistMenu:button("Max Payout is 3,619,000$"):event(0, function() end)
local pattern_str = "48 8D 15 ? ? ? ? 41 B8 18 02 00 00 E8"
local scan_result = memory.scan(pattern_str)
local has_gta_plus_addr = nil


if scan_result.value ~= 0 then
    has_gta_plus_addr = scan_result:rip(3, 7)
end

local is_loop_running = false

root:button("Unlock GTA Plus"):event(0, function()
    if is_loop_running then return end
    if not has_gta_plus_addr then return end

    is_loop_running = true

    while is_loop_running do
        has_gta_plus_addr.int32 = 1
        script.globals(1965683).bool = true
        script.globals(1965683):at(3).int32 = 10
        util:yield(10)
    end
end)


casinoHeistMenu:button("Skip Arcade Setup"):event(0, function()
    account.stats(27227, 1).bool = true
    account.stats(27227, 0).bool = true
    STATS.STAT_SAVE(script.globals(1574927).int32, true, 3, 0)
end)

presetsMenu:button("Silent & Sneaky Approach"):event(0, function()
    
    account.stats("MP0_H3OPT_MASKS").int32 = 4
    account.stats("MP1_H3OPT_MASKS").int32 = 4

    account.stats("MP0_H3OPT_WEAPS").int32 = 1
    account.stats("MP1_H3OPT_WEAPS").int32 = 1

    account.stats("MP0_H3OPT_VEHS").int32 = 3
    account.stats("MP1_H3OPT_VEHS").int32 = 3

    account.stats("MP0_CAS_HEIST_FLOW").int32 = -1
    account.stats("MP1_CAS_HEIST_FLOW").int32 = -1

    account.stats("MP0_H3_LAST_APPROACH").int32 = 0
    account.stats("MP1_H3_LAST_APPROACH").int32 = 0

    account.stats("MP0_H3OPT_APPROACH").int32 = 1
    account.stats("MP1_H3OPT_APPROACH").int32 = 1

    account.stats("MP0_H3_HARD_APPROACH").int32 = 1
    account.stats("MP1_H3_HARD_APPROACH").int32 = 1

    account.stats("MP0_H3OPT_TARGET").int32 = 3
    account.stats("MP1_H3OPT_TARGET").int32 = 3

    account.stats("MP0_H3OPT_POI").int32 = 1023
    account.stats("MP1_H3OPT_POI").int32 = 1023

    account.stats("MP0_H3OPT_ACCESSPOINTS").int32 = 2047
    account.stats("MP1_H3OPT_ACCESSPOINTS").int32 = 2047

    account.stats("MP0_H3OPT_CREWWEAP").int32 = 4
    account.stats("MP1_H3OPT_CREWWEAP").int32 = 4

    account.stats("MP0_H3OPT_CREWDRIVER").int32 = 3
    account.stats("MP1_H3OPT_CREWDRIVER").int32 = 3

    account.stats("MP0_H3OPT_CREWHACKER").int32 = 4
    account.stats("MP1_H3OPT_CREWHACKER").int32 = 4

    account.stats("MP0_H3OPT_DISRUPTSHIP").int32 = 3
    account.stats("MP1_H3OPT_DISRUPTSHIP").int32 = 3

    account.stats("MP0_H3OPT_BODYARMORLVL").int32 = -1
    account.stats("MP1_H3OPT_BODYARMORLVL").int32 = -1

    account.stats("MP0_H3OPT_KEYLEVELS").int32 = 2
    account.stats("MP1_H3OPT_KEYLEVELS").int32 = 2

    account.stats("MP0_H3OPT_BITSET1").int32 = 127
    account.stats("MP1_H3OPT_BITSET1").int32 = 127

    account.stats("MP0_H3OPT_BITSET0").int32 = 262270
    account.stats("MP1_H3OPT_BITSET0").int32 = 262270

    account.stats("MP0_CAS_HEIST_FLOW").int32 = -1
    account.stats("MP1_CAS_HEIST_FLOW").int32 = -1


    script.locals("gb_casino_heist_planning", 210).int32 = 2
end)

presetsMenu:button("The Big Con Approach"):event(0, function()
    local prefix0 = "MP0_"
    local prefix1 = "MP1_"

    account.stats(prefix0 .. "H3OPT_MASKS").int32 = 2
    account.stats(prefix1 .. "H3OPT_MASKS").int32 = 2
    account.stats(prefix0 .. "H3OPT_WEAPS").int32 = 1
    account.stats(prefix1 .. "H3OPT_WEAPS").int32 = 1
    account.stats(prefix0 .. "H3OPT_VEHS").int32 = 3
    account.stats(prefix1 .. "H3OPT_VEHS").int32 = 3
    account.stats(prefix0 .. "CAS_HEIST_FLOW").int32 = -1
    account.stats(prefix1 .. "CAS_HEIST_FLOW").int32 = -1
    account.stats(prefix0 .. "H3_LAST_APPROACH").int32 = 0
    account.stats(prefix1 .. "H3_LAST_APPROACH").int32 = 0
    account.stats(prefix0 .. "H3OPT_APPROACH").int32 = 2
    account.stats(prefix1 .. "H3OPT_APPROACH").int32 = 2
    account.stats(prefix0 .. "H3_HARD_APPROACH").int32 = 2
    account.stats(prefix1 .. "H3_HARD_APPROACH").int32 = 2
    account.stats(prefix0 .. "H3OPT_TARGET").int32 = 3
    account.stats(prefix1 .. "H3OPT_TARGET").int32 = 3
    account.stats(prefix0 .. "H3OPT_POI").int32 = 1023
    account.stats(prefix1 .. "H3OPT_POI").int32 = 1023
    account.stats(prefix0 .. "H3OPT_ACCESSPOINTS").int32 = 2047
    account.stats(prefix1 .. "H3OPT_ACCESSPOINTS").int32 = 2047
    account.stats(prefix0 .. "H3OPT_CREWWEAP").int32 = 4
    account.stats(prefix1 .. "H3OPT_CREWWEAP").int32 = 4
    account.stats(prefix0 .. "H3OPT_CREWDRIVER").int32 = 3
    account.stats(prefix1 .. "H3OPT_CREWDRIVER").int32 = 3
    account.stats(prefix0 .. "H3OPT_CREWHACKER").int32 = 4
    account.stats(prefix1 .. "H3OPT_CREWHACKER").int32 = 4
    account.stats(prefix0 .. "H3OPT_DISRUPTSHIP").int32 = 3
    account.stats(prefix1 .. "H3OPT_DISRUPTSHIP").int32 = 3
    account.stats(prefix0 .. "H3OPT_BODYARMORLVL").int32 = -1
    account.stats(prefix1 .. "H3OPT_BODYARMORLVL").int32 = -1
    account.stats(prefix0 .. "H3OPT_KEYLEVELS").int32 = 2
    account.stats(prefix1 .. "H3OPT_KEYLEVELS").int32 = 2
    account.stats(prefix0 .. "H3OPT_BITSET1").int32 = 159
    account.stats(prefix1 .. "H3OPT_BITSET1").int32 = 159
    account.stats(prefix0 .. "H3OPT_BITSET0").int32 = 524118
    account.stats(prefix1 .. "H3OPT_BITSET0").int32 = 524118
    account.stats(prefix0 .. "CAS_HEIST_FLOW").int32 = -1
    account.stats(prefix1 .. "CAS_HEIST_FLOW").int32 = -1

    script.locals("gb_casino_heist_planning", 210).int32 = 2
end)

presetsMenu:button("Aggressive Approach"):event(0, function()
    local prefix0 = "MP0_"
    local prefix1 = "MP1_"

    account.stats(prefix0 .. "H3OPT_MASKS").int32 = 4
    account.stats(prefix1 .. "H3OPT_MASKS").int32 = 4
    account.stats(prefix0 .. "H3OPT_WEAPS").int32 = 1
    account.stats(prefix1 .. "H3OPT_WEAPS").int32 = 1
    account.stats(prefix0 .. "H3OPT_VEHS").int32 = 3
    account.stats(prefix1 .. "H3OPT_VEHS").int32 = 3
    account.stats(prefix0 .. "CAS_HEIST_FLOW").int32 = -1
    account.stats(prefix1 .. "CAS_HEIST_FLOW").int32 = -1
    account.stats(prefix0 .. "H3_LAST_APPROACH").int32 = 0
    account.stats(prefix1 .. "H3_LAST_APPROACH").int32 = 0
    account.stats(prefix0 .. "H3OPT_APPROACH").int32 = 3
    account.stats(prefix1 .. "H3OPT_APPROACH").int32 = 3
    account.stats(prefix0 .. "H3_HARD_APPROACH").int32 = 3
    account.stats(prefix1 .. "H3_HARD_APPROACH").int32 = 3
    account.stats(prefix0 .. "H3OPT_TARGET").int32 = 3
    account.stats(prefix1 .. "H3OPT_TARGET").int32 = 3
    account.stats(prefix0 .. "H3OPT_POI").int32 = 1023
    account.stats(prefix1 .. "H3OPT_POI").int32 = 1023
    account.stats(prefix0 .. "H3OPT_ACCESSPOINTS").int32 = 2047
    account.stats(prefix1 .. "H3OPT_ACCESSPOINTS").int32 = 2047
    account.stats(prefix0 .. "H3OPT_CREWWEAP").int32 = 4
    account.stats(prefix1 .. "H3OPT_CREWWEAP").int32 = 4
    account.stats(prefix0 .. "H3OPT_CREWDRIVER").int32 = 3
    account.stats(prefix1 .. "H3OPT_CREWDRIVER").int32 = 3
    account.stats(prefix0 .. "H3OPT_CREWHACKER").int32 = 4
    account.stats(prefix1 .. "H3OPT_CREWHACKER").int32 = 4
    account.stats(prefix0 .. "H3OPT_DISRUPTSHIP").int32 = 3
    account.stats(prefix1 .. "H3OPT_DISRUPTSHIP").int32 = 3
    account.stats(prefix0 .. "H3OPT_BODYARMORLVL").int32 = -1
    account.stats(prefix1 .. "H3OPT_BODYARMORLVL").int32 = -1
    account.stats(prefix0 .. "H3OPT_KEYLEVELS").int32 = 2
    account.stats(prefix1 .. "H3OPT_KEYLEVELS").int32 = 2
    account.stats(prefix0 .. "H3OPT_BITSET1").int32 = 799
    account.stats(prefix1 .. "H3OPT_BITSET1").int32 = 799
    account.stats(prefix0 .. "H3OPT_BITSET0").int32 = 3670102
    account.stats(prefix1 .. "H3OPT_BITSET0").int32 = 3670102
    account.stats(prefix0 .. "CAS_HEIST_FLOW").int32 = -1
    account.stats(prefix1 .. "CAS_HEIST_FLOW").int32 = -1


    script.locals("gb_casino_heist_planning", 210).int32 = 2
end)

presetsMenu:button("Reset Heist Preps"):event(0, function()

    local prefix0 = "MP0_"
    local prefix1 = "MP1_"

    account.stats(prefix0 .. "H3OPT_DISRUPTSHIP").int32 = 0
    account.stats(prefix1 .. "H3OPT_DISRUPTSHIP").int32 = 0
    account.stats(prefix0 .. "H3OPT_BODYARMORLVL").int32 = 0
    account.stats(prefix1 .. "H3OPT_BODYARMORLVL").int32 = 0
    account.stats(prefix0 .. "H3OPT_CREWWEAP").int32 = 0
    account.stats(prefix1 .. "H3OPT_CREWWEAP").int32 = 0
    account.stats(prefix0 .. "H3OPT_CREWDRIVER").int32 = 0
    account.stats(prefix1 .. "H3OPT_CREWDRIVER").int32 = 0
    account.stats(prefix0 .. "H3OPT_CREWHACKER").int32 = 0
    account.stats(prefix1 .. "H3OPT_CREWHACKER").int32 = 0
    account.stats(prefix0 .. "H3OPT_KEYLEVELS").int32 = 0
    account.stats(prefix1 .. "H3OPT_KEYLEVELS").int32 = 0
    account.stats(prefix0 .. "H3OPT_MODVEH").int32 = 0
    account.stats(prefix1 .. "H3OPT_MODVEH").int32 = 0
    account.stats(prefix0 .. "H3OPT_MASKS").int32 = 0
    account.stats(prefix1 .. "H3OPT_MASKS").int32 = 0
    account.stats(prefix0 .. "H3OPT_WEAPS").int32 = 0
    account.stats(prefix1 .. "H3OPT_WEAPS").int32 = 0
    account.stats(prefix0 .. "H3OPT_VEHS").int32 = 0
    account.stats(prefix1 .. "H3OPT_VEHS").int32 = 0
    account.stats(prefix0 .. "H3OPT_APPROACH").int32 = 0
    account.stats(prefix1 .. "H3OPT_APPROACH").int32 = 0
    account.stats(prefix0 .. "H3OPT_BITSET0").int32 = 0
    account.stats(prefix1 .. "H3OPT_BITSET0").int32 = 0
    account.stats(prefix0 .. "H3OPT_ACCESSPOINTS").int32 = 0
    account.stats(prefix1 .. "H3OPT_ACCESSPOINTS").int32 = 0
    account.stats(prefix0 .. "H3OPT_TARGET").int32 = 0
    account.stats(prefix1 .. "H3OPT_TARGET").int32 = 0
    account.stats(prefix0 .. "H3OPT_POI").int32 = 0
    account.stats(prefix1 .. "H3OPT_POI").int32 = 0
    account.stats(prefix0 .. "H3OPT_BITSET1").int32 = 0
    account.stats(prefix1 .. "H3OPT_BITSET1").int32 = 0
    account.stats(prefix0 .. "H3_PARTIALPASS").int32 = 0
    account.stats(prefix1 .. "H3_PARTIALPASS").int32 = 0
    account.stats(prefix0 .. "CAS_HEIST_NOTS").int32 = 0
    account.stats(prefix1 .. "CAS_HEIST_NOTS").int32 = 0
    account.stats(prefix0 .. "CAS_HEIST_FLOW").int32 = -1
    account.stats(prefix1 .. "CAS_HEIST_FLOW").int32 = -1
    account.stats(prefix0 .. "H3_LAST_APPROACH").int32 = 0
    account.stats(prefix1 .. "H3_LAST_APPROACH").int32 = 0
    account.stats(prefix0 .. "H3_HARD_APPROACH").int32 = 0
    account.stats(prefix1 .. "H3_HARD_APPROACH").int32 = 0
    account.stats(prefix0 .. "H3_SKIPCOUNT").int32 = 0
    account.stats(prefix1 .. "H3_SKIPCOUNT").int32 = 0
    account.stats(prefix0 .. "H3_MISSIONSKIPPED").int32 = 0
    account.stats(prefix1 .. "H3_MISSIONSKIPPED").int32 = 0
    account.stats(prefix0 .. "H3_BOARD_DIALOGUE0").int32 = 0
    account.stats(prefix1 .. "H3_BOARD_DIALOGUE0").int32 = 0
    account.stats(prefix0 .. "H3_BOARD_DIALOGUE1").int32 = 0
    account.stats(prefix1 .. "H3_BOARD_DIALOGUE1").int32 = 0
    account.stats(prefix0 .. "H3_BOARD_DIALOGUE2").int32 = 0
    account.stats(prefix1 .. "H3_BOARD_DIALOGUE2").int32 = 0
    account.stats(prefix0 .. "H3_VEHICLESUSED").int32 = 0
    account.stats(prefix1 .. "H3_VEHICLESUSED").int32 = 0
    account.stats(prefix0 .. "MPPLY_H3_COOLDOWN").int32 = 0
    account.stats(prefix1 .. "MPPLY_H3_COOLDOWN").int32 = 0
    account.stats(prefix0 .. "H3_COMPLETEDPOSIX").int32 = 0
    account.stats("MP1_H3_COMPLETEDPOSIX").int32 = 0

    script.locals("gb_casino_heist_planning", 210).int32 = 2
end)

local casino_cuts_base = 1968996 + 1497 + 736 + 92
local default_idx_120_step2 = find_index(list_step_2, 120)

local casino_combo_cut1 = cutsMenu:combo_int("Host Cut %", list_step_2, default_idx_120_step2)
local casino_combo_cut2 = cutsMenu:combo_int("Player 2 Cut %", list_step_2, default_idx_120_step2)
local casino_combo_cut3 = cutsMenu:combo_int("Player 3 Cut %", list_step_2, default_idx_120_step2)
local casino_combo_cut4 = cutsMenu:combo_int("Player 4 Cut %", list_step_2, default_idx_120_step2)

local function get_casino_cut_value(combo_obj)
    if combo_obj.value > #list_step_2 then return 120 end
    return list_step_2[combo_obj.value][2]
end

local function apply_casino_cuts(cut1, cut2, cut3, cut4)
    script.globals(casino_cuts_base + 1).int32 = cut1
    script.globals(casino_cuts_base + 2).int32 = cut2
    script.globals(casino_cuts_base + 3).int32 = cut3
    script.globals(casino_cuts_base + 4).int32 = cut4
end


cutsMenu:button("Set All Cuts"):event(0, function()
    local c1 = get_casino_cut_value(casino_combo_cut1)
    local c2 = get_casino_cut_value(casino_combo_cut2)
    local c3 = get_casino_cut_value(casino_combo_cut3)
    local c4 = get_casino_cut_value(casino_combo_cut4)
    apply_casino_cuts(c1, c2, c3, c4)
end)

local function apply_casino_preset(c1, c2, c3, c4)

    apply_casino_cuts(c1, c2, c3, c4)

    local r1 = math.floor(c1 / 2 + 0.5) * 2
    local r2 = math.floor(c2 / 2 + 0.5) * 2
    local r3 = math.floor(c3 / 2 + 0.5) * 2
    local r4 = math.floor(c4 / 2 + 0.5) * 2

    casino_combo_cut1.value = find_index(list_step_2, r1)
    casino_combo_cut2.value = find_index(list_step_2, r2)
    casino_combo_cut3.value = find_index(list_step_2, r3)
    casino_combo_cut4.value = find_index(list_step_2, r4)
end


cutsMenu:button("Force Ready All"):event(0, function()
    script.globals(1973359 + 1 + (0 * 68) + 7 + 1).int32 = 1
    script.globals(1973359 + 1 + (1 * 68) + 7 + 2).int32 = 1
    script.globals(1973359 + 1 + (2 * 68) + 7 + 3).int32 = 1
    script.globals(1973359 + 1 + (3 * 68) + 7 + 4).int32 = 1
end)

toolsMenu:button("Fingerprint Hack"):event(0, function()

    local val1 = script.locals("fm_mission_controller", 54037).int32
    if (val1 & 1) == 0 then
        script.locals("fm_mission_controller", 54037).int32 = val1 | 1
    end
    
    local val2 = script.locals("fm_mission_controller", 55103).int32
    if (val2 & 1) == 0 then
        script.locals("fm_mission_controller", 55103).int32 = val2 | 1
    end
end)

toolsMenu:button("Instant Keypad Hack"):event(0, function()
    script.locals("fm_mission_controller", 55103).int32 = 5
end)


toolsMenu:button("Instant Vault Drill"):event(0, function()

    local target = script.locals("fm_mission_controller", 10549 + 37).int32
    
    script.locals("fm_mission_controller", 10549 + 7).int32 = target
    
    script.locals("fm_mission_controller", 10549 + 12).float = 1.0
    
    script.locals("fm_mission_controller", 10549 + 2).int32 = 7
    
    local bits = script.locals("fm_mission_controller", 10549).int32
    script.locals("fm_mission_controller", 10549).int32 = bits | (1 << 12)
end)

toolsMenu:button("Fix Stuck on Double Keycards"):event(0, function()
    script.locals("fm_mission_controller", 63634).int32 = 5
end)

toolsMenu:button("Remove Heist Cooldown"):event(0, function()
    local prefix0 = "MP0_"
    local prefix1 = "MP1_"

    account.stats(prefix0 .. "H3_COMPLETEDPOSIX").int32 = -1
    account.stats(prefix1 .. "H3_COMPLETEDPOSIX").int32 = -1
    account.stats(prefix0 .. "MPPLY_H3_COOLDOWN").int32 = -1
    account.stats(prefix1 .. "MPPLY_H3_COOLDOWN").int32 = -1
end)


toolsMenu:button("Set Team Lives to 100"):event(0, function()  
        local lives_lost_offset = 22122 
        local lives_lost_value = -100  
        script.locals("fm_mission_controller", lives_lost_offset).int32 = lives_lost_value
end)


toolsMenu:button("Instant Finish"):event(0, function()

    script.locals("fm_mission_controller", 20391 + 1740 + 1).int32 = 80
    script.locals("fm_mission_controller", 20391 + 2686).int32 = 4443220 
    script.locals("fm_mission_controller", 20391 + 1062).int32 = 5
    script.locals("fm_mission_controller", 20391).int32 = 12
    script.locals("fm_mission_controller", 29011 + 1).int32 = 99999
    script.locals("fm_mission_controller", 32467 + 1 + 68).int32 = 99999
end)

doomsHeistMenu:button("Max Payout is 2,550,000$"):event(0, function() end)

doomspresetMenu:button("Preset Act I: The Data Breaches"):event(0, function()
    local prefix0 = "MP0_"
    local prefix1 = "MP1_"

    account.stats(prefix0 .. "GANGOPS_FLOW_MISSION_PROG").int32 = 503
    account.stats(prefix1 .. "GANGOPS_FLOW_MISSION_PROG").int32 = 503
    account.stats(prefix0 .. "GANGOPS_HEIST_STATUS").int32 = -229383
    account.stats(prefix1 .. "GANGOPS_HEIST_STATUS").int32 = -229383
    account.stats(prefix0 .. "GANGOPS_FLOW_NOTIFICATIONS").int32 = 1557
    account.stats(prefix1 .. "GANGOPS_FLOW_NOTIFICATIONS").int32 = 1557

    script.locals("gb_gang_ops_planning", 209).int32 = 6

end)

doomspresetMenu:button("Preset Act II: The Bogdan Problem"):event(0, function()
    local prefix0 = "MP0_"
    local prefix1 = "MP1_"

    account.stats(prefix0 .. "GANGOPS_FLOW_MISSION_PROG").int32 = 240
    account.stats(prefix1 .. "GANGOPS_FLOW_MISSION_PROG").int32 = 240
    account.stats(prefix0 .. "GANGOPS_HEIST_STATUS").int32 = -229378
    account.stats(prefix1 .. "GANGOPS_HEIST_STATUS").int32 = -229378
    account.stats(prefix0 .. "GANGOPS_FLOW_NOTIFICATIONS").int32 = 1557
    account.stats(prefix1 .. "GANGOPS_FLOW_NOTIFICATIONS").int32 = 1557

    script.locals("gb_gang_ops_planning", 209).int32 = 6
end)

doomspresetMenu:button("Preset Act III: The Doomsday Scenario"):event(0, function()
    local prefix0 = "MP0_"
    local prefix1 = "MP1_"

    account.stats(prefix0 .. "GANGOPS_FLOW_MISSION_PROG").int32 = 16368
    account.stats(prefix1 .. "GANGOPS_FLOW_MISSION_PROG").int32 = 16368
    account.stats(prefix0 .. "GANGOPS_HEIST_STATUS").int32 = -229380
    account.stats(prefix1 .. "GANGOPS_HEIST_STATUS").int32 = -229380
    account.stats(prefix0 .. "GANGOPS_FLOW_NOTIFICATIONS").int32 = 1557
    account.stats(prefix1 .. "GANGOPS_FLOW_NOTIFICATIONS").int32 = 1557

    script.locals("gb_gang_ops_planning", 209).int32 = 6
end)

doomspresetMenu:button("Reset Doomsday Heist"):event(0, function()
    local prefix0 = "MP0_"
    local prefix1 = "MP1_"

    account.stats(prefix0 .. "GANGOPS_FLOW_MISSION_PROG").int32 = 503
    account.stats(prefix1 .. "GANGOPS_FLOW_MISSION_PROG").int32 = 503
    account.stats(prefix0 .. "GANGOPS_HEIST_STATUS").int32 = 0
    account.stats(prefix1 .. "GANGOPS_HEIST_STATUS").int32 = 0
    account.stats(prefix0 .. "GANGOPS_FLOW_NOTIFICATIONS").int32 = 1557
    account.stats(prefix1 .. "GANGOPS_FLOW_NOTIFICATIONS").int32 = 1557

    script.locals("gb_gang_ops_planning", 209).int32 = 6
end)

local dooms_cuts_base = 1965032
local default_idx_150_step5 = find_index(list_step_5, 150)

local dooms_combo_cut1 = doomsCutsMenu:combo_int("Host Cut %", list_step_5, default_idx_150_step5)
local dooms_combo_cut2 = doomsCutsMenu:combo_int("Player 2 Cut %", list_step_5, default_idx_150_step5)
local dooms_combo_cut3 = doomsCutsMenu:combo_int("Player 3 Cut %", list_step_5, default_idx_150_step5)
local dooms_combo_cut4 = doomsCutsMenu:combo_int("Player 4 Cut %", list_step_5, default_idx_150_step5)

local function get_dooms_cut_value(combo_obj)
    if combo_obj.value > #list_step_5 then return 150 end
    return list_step_5[combo_obj.value][2]
end

local function apply_dooms_cuts(cut1, cut2, cut3, cut4)
    script.globals(dooms_cuts_base + 1).int32 = cut1
    script.globals(dooms_cuts_base + 2).int32 = cut2
    script.globals(dooms_cuts_base + 3).int32 = cut3
    script.globals(dooms_cuts_base + 4).int32 = cut4
end

doomsCutsMenu:button("Apply Cuts"):event(0, function()
    local c1 = get_dooms_cut_value(dooms_combo_cut1)
    local c2 = get_dooms_cut_value(dooms_combo_cut2)
    local c3 = get_dooms_cut_value(dooms_combo_cut3)
    local c4 = get_dooms_cut_value(dooms_combo_cut4)
    apply_dooms_cuts(c1, c2, c3, c4)
end)

local function apply_dooms_preset(c1, c2, c3, c4)
    apply_dooms_cuts(c1, c2, c3, c4)
    local r1 = math.floor(c1 / 5 + 0.5) * 5
    local r2 = math.floor(c2 / 5 + 0.5) * 5
    local r3 = math.floor(c3 / 5 + 0.5) * 5
    local r4 = math.floor(c4 / 5 + 0.5) * 5

    dooms_combo_cut1.value = find_index(list_step_5, r1)
    dooms_combo_cut2.value = find_index(list_step_5, r2)
    dooms_combo_cut3.value = find_index(list_step_5, r3)
    dooms_combo_cut4.value = find_index(list_step_5, r4)
end

doomscutspresetMenu:button("Act 1 - The Data Breaches"):event(0, function()
    apply_dooms_preset(261, 261, 261, 261)
end)

doomscutspresetMenu:button("Act 2 - The Bogdan Problem"):event(0, function()
    apply_dooms_preset(178, 178, 178, 178)
end)

doomscutspresetMenu:button("Act 3 - Doomsday Scenario"):event(0, function()
    apply_dooms_preset(141, 141, 141, 141)
end)

local Ready = {
    Player1 = { type = "int", global = 1882449 + 1 + (0 * 149) + 43 + 11 + 1 },
    Player2 = { type = "int", global = 1882449 + 1 + (1 * 149) + 43 + 11 + 2 },
    Player3 = { type = "int", global = 1882449 + 1 + (2 * 149) + 43 + 11 + 3 },
    Player4 = { type = "int", global = 1882449 + 1 + (3 * 149) + 43 + 11 + 4 },
}

doomsCutsMenu:button("Force Ready All Players"):event(0, function()
    script.globals(Ready.Player1.global).int32 = 1
    script.globals(Ready.Player2.global).int32 = 1
    script.globals(Ready.Player3.global).int32 = 1
    script.globals(Ready.Player4.global).int32 = 1
end)
	
doomsToolsMenu:button("Bypass Hack Act I: The Data Breaches"):event(0, function()
        script.locals("fm_mission_controller", 1539).int32 = 2
end)

doomsToolsMenu:button("Bypass Hack Act III: The Doomsday"):event(0, function()
        script.locals("fm_mission_controller", 1431).int32 = 3
end)

doomsToolsMenu:button("Instant Server Farm Hack"):event(0, function()
    script.locals("fm_mission_controller", 1435).int32 = 2
end)

doomsToolsMenu:button("Instant Laser Hack"):event(0, function()
    script.locals("fm_mission_controller", 1296 + 135).int32 = 3
end)

doomsToolsMenu:button("Set Team Lives to 100"):event(0, function()    
        local lives_lost_offset = 22122 
        local lives_lost_value = -100   
        script.locals("fm_mission_controller", lives_lost_offset).int32 = lives_lost_value
end)


doomsToolsMenu:button("Instant Finish (Act 1 & 2)"):event(0, function()
    script.locals("fm_mission_controller", 20391 + 1725 + 1).int32 = 80
    script.locals("fm_mission_controller", 20391).int32 = 12
    script.locals("fm_mission_controller", 29011 + 1).int32 = 99999
    script.locals("fm_mission_controller", 32467 + 1 + 68).int32 = 99999
end)

doomsToolsMenu:button("Instant Finish (Act 3)"):event(0, function()
    script.locals("fm_mission_controller", 20391).int32 = 12
    script.locals("fm_mission_controller", 20391 + 1740 + 1).int32 = 150
    script.locals("fm_mission_controller", 20391 + 1062).int32 = 5
    script.locals("fm_mission_controller", 29011 + 1).int32 = 99999
    script.locals("fm_mission_controller", 32467 + 1 + 68).int32 = 99999
end)

classicHeistMenu:button("Max Payout is 3,000,000$"):event(0, function() end)

classicPrepsMenu:button("Skip Classic Heist Preps"):event(0, function()
    account.stats("MP0_HEIST_PLANNING_STAGE").int32 = -1
    account.stats("MP1_HEIST_PLANNING_STAGE").int32 = -1
end)

classicPrepsMenu:button("Redraw Heist Board"):event(0, function()
    script.globals(1931835).int32 = 22
end)

classicToolsMenu:button("Bypass Fleeca Hack"):event(0, function()
        script.locals("fm_mission_controller", 12244).int32 = 7
end)

classicToolsMenu:button("Instant Drill"):event(0, function()
    script.locals("fm_mission_controller", 10109 + 11).float = 1.0
end)

classicToolsMenu:button("Bypass Pacific Hack"):event(0, function()
        script.locals("fm_mission_controller", 10213).int32 = 9
end)

classicToolsMenu:button("Kill Classic Heist Cooldown"):event(0, function()

    local playerId = players.me().id
    local cooldownGlobal = 1876941 + 1 + (playerId * 77) + 76
    script.globals(cooldownGlobal).int32 = -1

end)

classicToolsMenu:button("Set Team Lives to 100"):event(0, function()    
        local lives_lost_offset = 22122 
        local lives_lost_value = -100  
        script.locals("fm_mission_controller", lives_lost_offset).int32 = lives_lost_value
end)


classicToolsMenu:button("Instant Finish (Pacific Standard)"):event(0, function()
    script.locals("fm_mission_controller", 20391 + 2686).int32 = 1875000
    script.locals("fm_mission_controller", 20391 + 1062).int32 = 5
    script.locals("fm_mission_controller", 20391).int32 = 12
    script.locals("fm_mission_controller", 29011 + 1).int32 = 99999
    script.locals("fm_mission_controller", 32467 + 1 + 68).int32 = 99999
end)

classicToolsMenu:button("Instant Finish (Other Classics)"):event(0, function()
    script.locals("fm_mission_controller", 20391 + 1725 + 1).int32 = 80
    script.locals("fm_mission_controller", 20391).int32 = 12
    script.locals("fm_mission_controller", 29011 + 1).int32 = 99999
    script.locals("fm_mission_controller", 32467 + 1 + 68).int32 = 99999
end)

classicHeistMenu:button("Unlock All Appartment Heist Jobs "):event(0, function()

    local fleeca_id = script.tunables("ROOT_ID_HASH_THE_FLECCA_JOB").int32
    local prison_id = script.tunables("ROOT_ID_HASH_THE_PRISON_BREAK").int32
    local humane_id = script.tunables("ROOT_ID_HASH_THE_HUMANE_LABS_RAID").int32
    local series_a_id = script.tunables("ROOT_ID_HASH_SERIES_A_FUNDING").int32
    local pacific_id = script.tunables("ROOT_ID_HASH_THE_PACIFIC_STANDARD_JOB").int32

    account.stats("MP0_HEIST_SAVED_STRAND_0").int32 = fleeca_id
    account.stats("MP0_HEIST_SAVED_STRAND_0_L").int32 = 5
    account.stats("MP1_HEIST_SAVED_STRAND_0").int32 = fleeca_id
    account.stats("MP1_HEIST_SAVED_STRAND_0_L").int32 = 5

    account.stats("MP0_HEIST_SAVED_STRAND_1").int32 = prison_id
    account.stats("MP0_HEIST_SAVED_STRAND_1_L").int32 = 5
    account.stats("MP1_HEIST_SAVED_STRAND_1").int32 = prison_id
    account.stats("MP1_HEIST_SAVED_STRAND_1_L").int32 = 5


    account.stats("MP0_HEIST_SAVED_STRAND_2").int32 = humane_id
    account.stats("MP0_HEIST_SAVED_STRAND_2_L").int32 = 5
    account.stats("MP1_HEIST_SAVED_STRAND_2").int32 = humane_id
    account.stats("MP1_HEIST_SAVED_STRAND_2_L").int32 = 5

    account.stats("MP0_HEIST_SAVED_STRAND_3").int32 = series_a_id
    account.stats("MP0_HEIST_SAVED_STRAND_3_L").int32 = 5
    account.stats("MP1_HEIST_SAVED_STRAND_3").int32 = series_a_id
    account.stats("MP1_HEIST_SAVED_STRAND_3_L").int32 = 5

    account.stats("MP0_HEIST_SAVED_STRAND_4").int32 = pacific_id
    account.stats("MP0_HEIST_SAVED_STRAND_4_L").int32 = 5
    account.stats("MP1_HEIST_SAVED_STRAND_4").int32 = pacific_id
    account.stats("MP1_HEIST_SAVED_STRAND_4_L").int32 = 5
end)

local classicCutsHelper = classicCutsMenu:submenu("Automated Heist Cut Preset")

local default_idx_100_step20 = find_index(list_step_20, 100)

local combo_cut1 = classicCutsMenu:combo_int("Classic Cut 1 (Host)", list_step_20, default_idx_100_step20)
local combo_cut2 = classicCutsMenu:combo_int("Classic Cut 2", list_step_20, default_idx_100_step20)
local combo_cut3 = classicCutsMenu:combo_int("Classic Cut 3", list_step_20, default_idx_100_step20)
local combo_cut4 = classicCutsMenu:combo_int("Classic Cut 4", list_step_20, default_idx_100_step20)

local function get_selected_cut_value(combo_obj)
    if combo_obj.value > #list_step_20 then return 100 end
    return list_step_20[combo_obj.value][2]
end

local function apply_cuts_from_values(cut1, cut2, cut3, cut4)
    local base_global = 1931800
    local base_local = 1933768 + 3008

    local total_cut = cut1 + cut2 + cut3 + cut4
    local over_cap = total_cut - 100

    if over_cap > 0 then
        script.globals(base_global + 1 + 1).int32 = -over_cap
    else
        script.globals(base_global + 1 + 1).int32 = 0
    end

    script.globals(base_global + 1 + 2).int32 = cut2
    script.globals(base_global + 1 + 3).int32 = cut3
    script.globals(base_global + 1 + 4).int32 = cut4

    script.globals(base_local + 1).int32 = cut1
    script.globals(base_local + 2).int32 = cut2
    script.globals(base_local + 3).int32 = cut3
    script.globals(base_local + 4).int32 = cut4
end

classicCutsMenu:button("Apply Cuts"):event(0, function()
    local c1 = get_selected_cut_value(combo_cut1)
    local c2 = get_selected_cut_value(combo_cut2)
    local c3 = get_selected_cut_value(combo_cut3)
    local c4 = get_selected_cut_value(combo_cut4)
    apply_cuts_from_values(c1, c2, c3, c4)
end)

local function apply_classic_preset(c1, c2, c3, c4)
    apply_cuts_from_values(c1, c2, c3, c4)

    local r1 = math.floor(c1 / 20 + 0.5) * 20
    local r2 = math.floor(c2 / 20 + 0.5) * 20
    local r3 = math.floor(c3 / 20 + 0.5) * 20
    local r4 = math.floor(c4 / 20 + 0.5) * 20
    
    combo_cut1.value = find_index(list_step_20, r1)
    combo_cut2.value = find_index(list_step_20, r2)
    combo_cut3.value = find_index(list_step_20, r3)
    combo_cut4.value = find_index(list_step_20, r4)
end

classicCutsHelper:button("Max payout Fleeca Heist"):event(0, function()
    apply_classic_preset(1490, 1490, 1490, 1490)
end)

classicCutsHelper:button("Max payout Prison Break"):event(0, function()
    apply_classic_preset(429, 429, 429, 429)
end)

classicCutsHelper:button("Max payout Humane Labs"):event(0, function()
    apply_classic_preset(317, 317, 317, 317)
end)

classicCutsHelper:button("Max payout A-Series (trevor)"):event(0, function()
    apply_classic_preset(424, 424, 424, 424)
end)

classicCutsHelper:button("Max payout Pacific Standard Hard Mode"):event(0, function()
    apply_classic_preset(160, 160, 160, 160)
end)


classicCutsMenu:button("Force Ready"):event(0, function()
    for i = 1, 4 do
        local base = 2658019
        local globalIndex = base + 1 + ((i - 1) * 467) + 269
        script.globals(globalIndex).int32 = 6
    end
end)


cluckinMenu:button("Skip to Finale"):event(0, function()

    account.stats("MP0_SALV23_INST_PROG").int32 = 31
    account.stats("MP1_SALV23_INST_PROG").int32 = 31
    
    local other_stats = { "SALV23_GEN_BS", "SALV23_SCOPE_BS", "SALV23_FM_PROG" }
    for _, stat in ipairs(other_stats) do
        account.stats("MP0_" .. stat).int32 = -1
        account.stats("MP1_" .. stat).int32 = -1
    end
 
end)

cluckinMenu:button("Remove Cooldown"):event(0, function()
    account.stats("MP0_SALV23_CFR_COOLDOWN").int32 = -1
    account.stats("MP1_SALV23_CFR_COOLDOWN").int32 = -1
end)

cluckinMenu:button("Reset Progress"):event(0, function()
    account.stats("MP0_SALV23_INST_PROG").int32 = 0
    account.stats("MP1_SALV23_INST_PROG").int32 = 0
end)


cluckinMenu:button("Instant Finish"):event(0, function()
    local action_taken = false

    if script.running("circuitblockhack") then
        script.locals("circuitblockhack", 62).int32 = 2
        action_taken = true
    end

    if script.running("word_hack") then
        script.locals("word_hack", 106).int32 = 5
        action_taken = true
    end
    
    if not action_taken and script.running("fm_mission_controller_2020") then
        script.locals("fm_mission_controller_2020", 54763 + 1).int32 = 51338752 
        script.locals("fm_mission_controller_2020", 54763 + 1776 + 1).int32 = 50
    end
end)


salvagePrepsMenu:button("Complete Mission Preps"):event(0, function()
    local stats = { "SALV23_GEN_BS", "SALV23_SCOPE_BS", "SALV23_FM_PROG", "SALV23_INST_PROG" }
    for _, statName in ipairs(stats) do
        account.stats("MP0_" .. statName).int32 = -1
        account.stats("MP1_" .. statName).int32 = -1
    end
end)

salvagePrepsMenu:button("Reload Mission Board"):event(0, function()
    script.locals("vehrob_planning", 535).int32 = 2
end)

salvagePrepsMenu:button("Reset Mission Preps"):event(0, function()
    local stats = { "SALV23_GEN_BS", "SALV23_SCOPE_BS", "SALV23_FM_PROG", "SALV23_INST_PROG" }
    for _, statName in ipairs(stats) do
        account.stats("MP0_" .. statName).int32 = 0
        account.stats("MP1_" .. statName).int32 = 0
    end
end)


salvageToolsMenu:button("Bypass Unable To Start Error"):event(0, function()
    script.locals("vehrob_planning", 416).int32 = 1
    script.locals("tuner_planning", 406).int32 = 2
end)


salvageToolsMenu:button("Instant Finish: Cargo Ship"):event(0, function()
        script.locals("fm_content_vehrob_cargo_ship",7163 + 1).int32 = -2145370424
        script.locals("fm_content_vehrob_cargo_ship",7308 + 1250).int32 = 1
end)

salvageToolsMenu:button("Instant Finish: Gangbanger"):event(0, function()
        script.locals("fm_content_vehrob_police",8989 + 1).int32 = -2145370424
        script.locals("fm_content_vehrob_police",9122 + 1306).int32 = 1
end)

salvageToolsMenu:button("Instant Finish: Duggan"):event(0, function()
        script.locals("fm_content_vehrob_arena",7894 + 1).int32 = -2145370424
        script.locals("fm_content_vehrob_arena",8014 + 1315).int32 = 1
        thread:remove()
end)

salvageToolsMenu:button("Instant Finish: Podium"):event(0, function()
        script.locals("fm_content_vehrob_casino_prize",9163 + 1).int32 = -2145370424
        script.locals("fm_content_vehrob_casino_prize",9300 + 1259).int32 = 1
        thread:remove()
end)

salvageToolsMenu:button("Instant Finish: McTony"):event(0, function()
        script.locals("fm_content_vehrob_submarine",6198 + 1).int32 = -2145370424
        script.locals("fm_content_vehrob_submarine",6336 + 1160).int32 = 1
        thread:remove()
end)


local selectedContractIndex = 3 

local function selectContract(index, name)
    selectedContractIndex = index
end

contractsMenu:button("None"):event(0, function() selectContract(3, "None") end)
contractsMenu:button("Nightclub"):event(0, function() selectContract(4, "Nightclub") end)
contractsMenu:button("Marina"):event(0, function() selectContract(12, "Marina") end)
contractsMenu:button("Nightlife Leak"):event(0, function() selectContract(28, "Nightlife Leak") end)
contractsMenu:button("Country Club"):event(0, function() selectContract(60, "Country Club") end)
contractsMenu:button("Guest List"):event(0, function() selectContract(123, "Guest List") end)
contractsMenu:button("High Soc. Leak"):event(0, function() selectContract(254, "High Soc. Leak") end)
contractsMenu:button("Davis"):event(0, function() selectContract(508, "Davis") end)
contractsMenu:button("Ballas"):event(0, function() selectContract(1020, "Ballas") end)
contractsMenu:button("Sou. Cen. Leak"):event(0, function() selectContract(2044, "Sou. Cen. Leak") end)
contractsMenu:button("Studio Time"):event(0, function() selectContract(2045, "Studio Time") end)
contractsMenu:button("Don't # W. Dre"):event(0, function() selectContract(4095, "Don't # W. Dre") end)

agencyPrepsMenu:button("Complete Preps and Apply Contract"):event(0, function()

    local activeChar = script.globals(1574927).int32
    if activeChar ~= 0 and activeChar ~= 1 then activeChar = 0 end 
    local prefix = "MP" .. activeChar .. "_"

    account.stats(prefix .. "FIXER_STORY_BS").int32 = selectedContractIndex

    local strand = -1
    if selectedContractIndex < 18 then
        strand = 0
    elseif selectedContractIndex < 128 then
        strand = 1
    elseif selectedContractIndex < 2044 then
        strand = 2
    end

    account.stats(prefix .. "FIXER_STORY_STRAND").int32 = strand
    account.stats(prefix .. "FIXER_GENERAL_BS").int32 = -1
    account.stats(prefix .. "FIXER_COMPLETED_BS").int32 = -1
end)


agencyToolsMenu:button("Set Max Payout (Use after mission started)"):event(0, function()
    script.globals(262145 + 31249).int32 = 2500000
end)

agencyToolsMenu:button("Remove Cooldown Agency"):event(0, function()
    local charIndex = script.globals(1574927).int32 or 0
    if charIndex ~= 1 then charIndex = 0 end 
    local prefix = "MP" .. tostring(charIndex) .. "_"

    account.stats(prefix .. "FIXER_STORY_COOLDOWN_POSIX").int32 = 0
    account.stats(prefix .. "FIXER_SECURITY_CONTRACT_COOLDOWN_TIME").int32 = 0
    account.stats(prefix .. "REQUEST_FRANKLIN_PAYPHONE_HIT_COOLDOWN").int32 = 0

end)

agencyToolsMenu:button("Instant Laptop Hack"):event(0, function()
    if script.running("fm_mission_controller") then
        script.locals("fm_mission_controller", 171).int32 = 0
        script.locals("fm_mission_controller", 168).int32 = 0
        script.locals("fm_mission_controller", 183).int32 = 7
    end
end)


agencyToolsMenu:button("Instant Finish Agency"):event(0, function()
        script.locals("fm_mission_controller_2020", 54763 + 1).int32 = 51338752
        script.locals("fm_mission_controller_2020", 54763 + 1776 + 1).int32 = 50
end)

local selectedContract = -1 

local autoShopContracts = {
    { name = "None", index = -1 },
    { name = "Union Depository", index = 0 },
    { name = "Superdollar Deal", index = 1 },
    { name = "Bank Contract", index = 2 },
    { name = "ECU Job", index = 3 },
    { name = "Prison Contract", index = 4 },
    { name = "Agency Deal", index = 5 },
    { name = "Lost Contract", index = 6 },
    { name = "Data Contract", index = 7 }
}

local function apply_and_complete_auto_shop()
    if selectedContract < 0 then
        return
    end

    local activeChar = script.globals(1574927).int32
    if activeChar ~= 0 and activeChar ~= 1 then activeChar = 0 end 
    local prefix = "MP" .. activeChar .. "_"

    account.stats(prefix .. "TUNER_CURRENT").int32 = selectedContract

    local gen_bs_value = (selectedContract == 1) and 4351 or 12543
    account.stats(prefix .. "TUNER_GEN_BS").int32 = gen_bs_value

    script.locals("tuner_planning", 406).int32 = 2
end


for _, contract in ipairs(autoShopContracts) do
    autoshopcontractsmenu:button(contract.name):event(0, function()
        selectedContract = contract.index
    end)
end

autoshopPrepsMenu:button("Skip Preps And Apply Contract"):event(0, function()
    apply_and_complete_auto_shop()
end)

autoshopPrepsMenu:button("Redraw Board"):event(0, function()
    script.locals("tuner_planning", 406).int32 = 2
end)

autoshopToolMenu:button("Instant Finish Auto Shop"):event(0, function()
        script.locals("fm_mission_controller_2020", 54763 + 1).int32 = 51338977
        script.locals("fm_mission_controller_2020", 54763 + 1776 + 1).int32 = 101
end)

autoshopToolMenu:button("Instant Voltlab"):event(0, function()
    if script.running("fm_mission_controller_2020") then
        local target = script.locals("fm_mission_controller_2020", 1749).int32
        script.locals("fm_mission_controller_2020", 1748).int32 = target
        script.locals("fm_mission_controller_2020", 1750).int32 = 3
    end
end)

local payout = 1000000


local default_idx_autoshop = find_index(list_autoshop_payout, 1000000)
autoshopmoneyMenu:combo_int("Payout Amount", list_autoshop_payout, default_idx_autoshop):event(0, function(combo)
    payout = list_autoshop_payout[combo.value][2]
end)

autoshopmoneyMenu:button("Max Payout (does not apply)"):event(0, function()
    payout = 2200000
end)


autoshopmoneyMenu:button("Apply Payout (Use when mission started)"):event(0, function()

    script.tunables("TUNER_ROBBERY_LEADER_CASH_REWARD0").int32 = payout
    script.tunables("TUNER_ROBBERY_LEADER_CASH_REWARD1").int32 = payout
    script.tunables("TUNER_ROBBERY_LEADER_CASH_REWARD2").int32 = payout
    script.tunables("TUNER_ROBBERY_LEADER_CASH_REWARD3").int32 = payout
    script.tunables("TUNER_ROBBERY_LEADER_CASH_REWARD4").int32 = payout
    script.tunables("TUNER_ROBBERY_LEADER_CASH_REWARD5").int32 = payout
    script.tunables("TUNER_ROBBERY_LEADER_CASH_REWARD6").int32 = payout
    script.tunables("TUNER_ROBBERY_LEADER_CASH_REWARD7").int32 = payout
    script.locals("tuner_planning", 406).int32 = 2
end)

autoshopmoneyMenu:button("Max Payout does not work with Union Depository"):event(0, function() end)


cayoMenu:button("Max Payout is 2,550,000$"):event(0, function() end)

local function MPX_Cayo()
    local charIndex = script.globals(1574927).int32
    return "MP" .. tostring(charIndex) .. "_"
end

local function unlockAllCayoPOI()

    account.stats("MP0_H4CNF_BS_GEN").int32 = -1
    account.stats("MP0_H4CNF_BS_ENTR").int32 = 63
    account.stats("MP0_H4CNF_BS_ABIL").int32 = 63
    account.stats("MP0_H4CNF_APPROACH").int32 = -1
    account.stats("MP0_H4_PLAYTHROUGH_STATUS").int32 = 10
    script.locals("heist_island_planning", 1568).int32 = 2

    account.stats("MP1_H4CNF_BS_GEN").int32 = -1
    account.stats("MP1_H4CNF_BS_ENTR").int32 = 63
    account.stats("MP1_H4CNF_BS_ABIL").int32 = 63
    account.stats("MP1_H4CNF_APPROACH").int32 = -1
    account.stats("MP1_H4_PLAYTHROUGH_STATUS").int32 = 10
    script.locals("heist_island_planning", 1568).int32 = 2
end

cayoprepsMenu:button("Unlock All Cayo POI"):event(0, unlockAllCayoPOI)

local selectedDifficulty = 126823
local difficulties = {
    { name = "Normal", index = 126823 },
    { name = "Hard", index = 131055 }
}
for _, diff in ipairs(difficulties) do
    difficultyMenu:button(diff.name):event(0, function()
        selectedDifficulty = diff.index
    end)
end

local selectedApproach = 65535
local approaches = {
    { name = "Kosatka", index = 65283 }, { name = "Alkonost", index = 65413 },
    { name = "Velum", index = 65289 }, { name = "Stealth Annih.", index = 65425 },
    { name = "Patrol Boat", index = 65313 }, { name = "Longfin", index = 65345 },
    { name = "All Ways", index = 65535 }
}
for _, approach in ipairs(approaches) do
    approachMenu:button(approach.name):event(0, function()
        selectedApproach = approach.index
    end)
end

local selectedLoadout = 1
local loadouts = {
    { name = "Aggressor", index = 1 }, { name = "Conspirator", index = 2 },
    { name = "Crackshot", index = 3 }, { name = "Saboteur", index = 4 },
    { name = "Marksman", index = 5 }
}
for _, loadout in ipairs(loadouts) do
    loadoutMenu:button(loadout.name):event(0, function()
        selectedLoadout = loadout.index
    end)
end

local selectedTarget = 5
local targets = {
    { name = "Tequila", index = 0 }, { name = "Ruby Necklace", index = 1 },
    { name = "Bearer Bonds", index = 2 }, { name = "Pink Diamond", index = 3 },
    { name = "Madrazo Files", index = 4 }, { name = "Panther Statue", index = 5 }
}
for _, target in ipairs(targets) do
    targetMenu:button(target.name):event(0, function()
        selectedTarget = target.index
    end)
end

local selectedCompoundTarget = "GOLD"
local selectedIslandTarget = "GOLD"

local secondaryTargets = {
    { name = "None", index = "NONE" }, { name = "Cash", index = "CASH" },
    { name = "Weed", index = "WEED" }, { name = "Coke", index = "COKE" },
    { name = "Gold", index = "GOLD" }
}

for _, target in ipairs(secondaryTargets) do
    secondaryMenu:button(target.name):event(0, function()
        selectedCompoundTarget = target.index
    end)
end

for _, target in ipairs(secondaryTargets) do
    islandTargetMenu:button(target.name):event(0, function()
        selectedIslandTarget = target.index
    end)
end

local selectedCompoundAmount = 255
local compoundAmounts = {
    { name = "Empty", index = 0 }, { name = "Full", index = 255 }, { name = "1", index = 128 },
    { name = "2", index = 64 }, { name = "3", index = 196 }, { name = "4", index = 204 },
    { name = "5", index = 220 }, { name = "6", index = 252 }, { name = "7", index = 253 }
}
for _, amount in ipairs(compoundAmounts) do
    compoundAmountMenu:button(amount.name):event(0, function()
        selectedCompoundAmount = amount.index
    end)
end

local selectedIslandAmount = 16777215
local islandAmounts = {
    { name = "Empty", index = 0 }, { name = "Full", index = 16777215 }, { name = "1", index = 8388608 },
    { name = "2", index = 12582912 }, { name = "3", index = 12845056 }, { name = "4", index = 12976128 },
    { name = "5", index = 13500416 }, { name = "6", index = 14548992 }, { name = "7", index = 16646144 },
    { name = "8", index = 16711680 }, { name = "9", index = 16744448 }, { name = "10", index = 16760832 },
    { name = "11", index = 16769024 }, { name = "12", index = 16769536 }, { name = "13", index = 16770560 },
    { name = "14", index = 16770816 }, { name = "15", index = 16770880 }, { name = "16", index = 16771008 },
    { name = "17", index = 16773056 }, { name = "18", index = 16777152 }, { name = "19", index = 16777184 },
    { name = "20", index = 16777200 }, { name = "21", index = 16777202 }, { name = "22", index = 16777203 },
    { name = "23", index = 16777211 }
}
for _, amount in ipairs(islandAmounts) do
    islandAmountMenu:button(amount.name):event(0, function()
        selectedIslandAmount = amount.index
    end)
end

local selectedArtsAmount = 127
local artsAmounts = {
    { name = "Empty", index = 0 }, { name = "Full", index = 127 }, { name = "1", index = 64 },
    { name = "2", index = 96 }, { name = "3", index = 112 }, { name = "4", index = 120 },
    { name = "5", index = 122 }, { name = "6", index = 126 }
}
for _, amount in ipairs(artsAmounts) do
    artsAmountMenu:button(amount.name):event(0, function()
        selectedArtsAmount = amount.index
    end)
end

local cashValue = 83250
local weedValue = 135000
local cokeValue = 202500
local goldValue = 333333
local artsValue = 180000

local default_cayo_cash = find_index(list_cayo_cash_val, cashValue)
LootOptionsMenu:combo_int("Cash Value", list_cayo_cash_val, default_cayo_cash):event(0, function(combo)
    cashValue = list_cayo_cash_val[combo.value][2]
end)

local default_cayo_weed = find_index(list_cayo_weed_val, weedValue)
LootOptionsMenu:combo_int("Weed Value", list_cayo_weed_val, default_cayo_weed):event(0, function(combo)
    weedValue = list_cayo_weed_val[combo.value][2]
end)

local default_cayo_coke = find_index(list_cayo_coke_val, cokeValue)
LootOptionsMenu:combo_int("Coke Value", list_cayo_coke_val, default_cayo_coke):event(0, function(combo)
    cokeValue = list_cayo_coke_val[combo.value][2]
end)

local default_cayo_gold = find_index(list_cayo_gold_val, goldValue)
LootOptionsMenu:combo_int("Gold Value", list_cayo_gold_val, default_cayo_gold):event(0, function(combo)
    goldValue = list_cayo_gold_val[combo.value][2]
end)

local default_cayo_arts = find_index(list_cayo_arts_val, artsValue)
LootOptionsMenu:combo_int("Arts Value", list_cayo_arts_val, default_cayo_arts):event(0, function(combo)
    artsValue = list_cayo_arts_val[combo.value][2]
end)


local function applyPreps(
    selectedDifficulty, selectedApproach, selectedLoadout,
    selectedTarget,
    selectedCompoundTarget, selectedCompoundAmount, selectedArtsAmount,
    selectedIslandTarget, selectedIslandAmount,
    cashValue, weedValue, cokeValue, goldValue, artsValue)

    local prefix = MPX_Cayo()

    account.stats(prefix .. "H4_PROGRESS").int32 = selectedDifficulty
    account.stats(prefix .. "H4_MISSIONS").int32 = selectedApproach
    account.stats(prefix .. "H4CNF_WEAPONS").int32 = selectedLoadout
    account.stats(prefix .. "H4CNF_TARGET").int32 = selectedTarget

    local lootTypes = { "CASH", "WEED", "COKE", "GOLD" }
    for _, loot in ipairs(lootTypes) do
        local value = (selectedCompoundTarget == loot) and selectedCompoundAmount or 0
        account.stats(prefix .. "H4LOOT_" .. loot .. "_C").int32 = value
        account.stats(prefix .. "H4LOOT_" .. loot .. "_C_SCOPED").int32 = value
    end

    for _, loot in ipairs(lootTypes) do
        local value = (selectedIslandTarget == loot) and selectedIslandAmount or 0
        account.stats(prefix .. "H4LOOT_" .. loot .. "_I").int32 = value
        account.stats(prefix .. "H4LOOT_" .. loot .. "_I_SCOPED").int32 = value
    end

    account.stats(prefix .. "H4LOOT_PAINT").int32 = selectedArtsAmount or 0
    account.stats(prefix .. "H4LOOT_PAINT_SCOPED").int32 = selectedArtsAmount or 0

    local lootValues = { CASH = cashValue, WEED = weedValue, COKE = cokeValue, GOLD = goldValue }
    for loot, value in pairs(lootValues) do
        local hasLoot = (selectedCompoundTarget == loot or selectedIslandTarget == loot)
        account.stats(prefix .. "H4LOOT_" .. loot .. "_V").int32 = hasLoot and value or 0
    end

    account.stats(prefix .. "H4LOOT_PAINT_V").int32 = selectedArtsAmount > 0 and artsValue or 0

    account.stats(prefix .. "H4CNF_UNIFORM").int32 = -1
    account.stats(prefix .. "H4CNF_GRAPPEL").int32 = -1
    account.stats(prefix .. "H4CNF_TROJAN").int32 = 5
    account.stats(prefix .. "H4CNF_WEP_DISRP").int32 = 3
    account.stats(prefix .. "H4CNF_ARM_DISRP").int32 = 3
    account.stats(prefix .. "H4CNF_HEL_DISRP").int32 = 3

    script.locals("heist_island_planning", 1568).int32 = 2
end

cayoprepsMenu:button("Apply Preps"):event(0, function()
    applyPreps(
        selectedDifficulty,
        selectedApproach,
        selectedLoadout,
        selectedTarget,
        selectedCompoundTarget,
        selectedCompoundAmount,
        selectedArtsAmount,
        selectedIslandTarget,
        selectedIslandAmount,
        cashValue,
        weedValue,
        cokeValue,
        goldValue,
        artsValue
    )
end)


local function reset_cayo_preps()
    local prefix = MPX_Cayo()

    account.stats(prefix .. "H4_PROGRESS").int32 = 0
    account.stats(prefix .. "H4_MISSIONS").int32 = 0
    account.stats(prefix .. "H4CNF_APPROACH").int32 = 0
    account.stats(prefix .. "H4CNF_TARGET").int32 = -1
    account.stats(prefix .. "H4CNF_BS_GEN").int32 = 0
    account.stats(prefix .. "H4CNF_BS_ENTR").int32 = 0
    account.stats(prefix .. "H4CNF_BS_ABIL").int32 = 0
    account.stats(prefix .. "H4_PLAYTHROUGH_STATUS").int32 = 0

    script.locals("heist_island_planning", 1568).int32 = 2
end


cayoprepsMenu:button("Reset Preps"):event(0, function()
    reset_cayo_preps()
end)

cayotoolsMenu:button("Reload Planning Screen"):event(0, function()
    script.locals("heist_island_planning", 1568).int32 = 2
end)



cayotoolsMenu:button("Instant Voltlab Hack"):event(0, function()
    if script.running("fm_content_island_heist") then
        local target = script.locals("fm_content_island_heist", 792).int32
        script.locals("fm_content_island_heist", 791).int32 = target
        script.locals("fm_content_island_heist", 793).int32 = 3
        script.locals("fm_content_island_heist", 10166 + 24).int32 = 7
    end
    
    if script.running("fm_mission_controller_2020") then
        local target = script.locals("fm_mission_controller_2020", 1749).int32
        script.locals("fm_mission_controller_2020", 1748).int32 = target
        script.locals("fm_mission_controller_2020", 1750).int32 = 3
    end
end)

cayotoolsMenu:button("Instant Password Hack"):event(0, function()

        script.locals("fm_mission_controller_2020", 25460).int32 = 5
end)

cayotoolsMenu:button("Bypass Plasma Cutter"):event(0, function()
    script.locals("fm_mission_controller_2020", 31525 + 3).float = 100.0
end)

cayotoolsMenu:button("Bypass Drainage Pipe Cut"):event(0, function()
    script.locals("fm_mission_controller_2020", 30285).int32 = 6
end)

cayotoolsMenu:button("Remove Solo Cooldown"):event(0, function()
    local prefix = MPX_Cayo()
    account.stats(prefix .. "H4_TARGET_POSIX").int32 = 1659643454
    account.stats(prefix .. "H4_COOLDOWN").int32 = 0
    account.stats(prefix .. "H4_COOLDOWN_HARD").int32 = 0
end)

cayotoolsMenu:button("Remove Team Cooldown"):event(0, function()
    local prefix = MPX_Cayo()
    account.stats(prefix .. "H4_TARGET_POSIX").int32 = 1659429119
    account.stats(prefix .. "H4_COOLDOWN").int32 = 0
    account.stats(prefix .. "H4_COOLDOWN_HARD").int32 = 0
end)

cayotoolsMenu:button("Instant Finish Cayo"):event(0, function()
        script.locals("fm_mission_controller_2020", 54763).int32 = 9
        script.locals("fm_mission_controller_2020", 54763 + 1776 + 1).int32 = 50
end)

local cayo_cuts_base = 1975799 + 831 + 56
local default_idx_100_step25_cayo = find_index(list_step_25, 100)
local cayo_combo_cut1 = cayoCutsMenu:combo_int("Host Cut %", list_step_25, default_idx_100_step25_cayo)
local cayo_combo_cut2 = cayoCutsMenu:combo_int("Player 2 Cut %", list_step_25, default_idx_100_step25_cayo)
local cayo_combo_cut3 = cayoCutsMenu:combo_int("Player 3 Cut %", list_step_25, default_idx_100_step25_cayo)
local cayo_combo_cut4 = cayoCutsMenu:combo_int("Player 4 Cut %", list_step_25, default_idx_100_step25_cayo)

local function get_cayo_cut_value(combo_obj)
    if combo_obj.value > #list_step_25 then return 100 end
    return list_step_25[combo_obj.value][2]
end

local function apply_cayo_cuts(cut1, cut2, cut3, cut4)
    script.globals(cayo_cuts_base + 1).int32 = cut1
    script.globals(cayo_cuts_base + 2).int32 = cut2
    script.globals(cayo_cuts_base + 3).int32 = cut3
    script.globals(cayo_cuts_base + 4).int32 = cut4
end

cayoCutsMenu:button("Apply Cuts"):event(0, function()
    local c1 = get_cayo_cut_value(cayo_combo_cut1)
    local c2 = get_cayo_cut_value(cayo_combo_cut2)
    local c3 = get_cayo_cut_value(cayo_combo_cut3)
    local c4 = get_cayo_cut_value(cayo_combo_cut4)
    apply_cayo_cuts(c1, c2, c3, c4)
end)

cayoCutsMenu:button("Force Ready players Cayo"):event(0, function()
    script.globals(1976911 + 1 + (1 * 27) + 7 + 1).int32 = 1
    script.globals(1976911 + 1 + (1 * 27) + 7 + 2).int32 = 1
    script.globals(1976911 + 1 + (2 * 27) + 7 + 3).int32 = 1
    script.globals(1976911 + 1 + (3 * 27) + 7 + 4).int32 = 1
end)

