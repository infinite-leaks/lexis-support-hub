-- Silent Night Heists Manager Lexis Port [SKID] { Credits: https://github.com/SilentSalo/SilentNight | https://github.com/xnightli06x/Silent-Night }
-- Ported by @lrxxh & @piuro with the help of: Derkek, melonarmy122
-- Testers: Derkek, 223, camera, Plex, Nexus
-- TODO: Doomsday, Cayo, Casino EXTRA options, Solo Launch [Apartment is done? - Need to copy over], whatever else is missing.
-- HAVE FUN
local success, error = pcall(function()

    local function log_notify(message)
        notify.push('[Heist Utils]', message, 2000)
        print(message)
    end

    local function MPX()
        return "MP" .. account.stats("MPPLY_LAST_MP_CHAR").int32 .. "_"
    end

    local function SetBit(value, position)
        return value | (1 << position)
    end

    local function SetBits(value, positions)
        for _, position in ipairs(positions) do
            value = SetBit(value, position)
        end
        return value
    end

    local function setCuts(heist, cuts)
        local base_values = {
            CAYO = 1975799 + 831 + 56,
            DOOMSDAY = 1964170 + 812 + 50,
            DIAMOND = 1968996 + 1497 + 736 + 92,
            AUTOSHOP = 1975799 + 831 + 56,
            AGENCY = 1975799 + 831 + 56
        }

        local base = base_values[heist]

        if not base and heist ~= 'APARTMENT' then
            log_notify('Invalid heist type')
            return
        elseif heist == 'APARTMENT' and not base then
            base = 1931800 + 1
            for i, cut in ipairs(cuts) do
                if i == 1 then
                    script.globals(base + i).int32 = 100 - (4 * cut)
                    script.globals(1933768 + 3008 + 1).int32 = cut
                else
                    script.globals(base + i).int32 = cut
                end
            end
        else
            for i, cut in ipairs(cuts) do
                script.globals(base + i).int32 = cut
            end
        end
    end

    local function DoomsdayActSetter(progress, status)
        account.stats(MPX() .. "GANGOPS_FLOW_MISSION_PROG").int32 = progress
        account.stats(MPX() .. "GANGOPS_HEIST_STATUS").int32 = status
        account.stats(MPX() .. "GANGOPS_FLOW_NOTIFICATIONS").int32 = 1557
    end

    local function DoomsdayReloadTable()
        script.locals("gb_gang_ops_planning", 209).int32 = 6
    end

    local function CasinoReloadTable()
        script.locals("gb_casino_heist_planning", 210).int32 = 2
    end

    local function CayoReloadTable()
        script.locals("heist_island_planning", 1568).int32 = 2
    end

    local function ApartmentReloadTable()
        script.globals(1931835).int32 = 22
    end

    local function SoloLaunch()
        local Launch = {
            locals = {
                Step1 = {
                    vLocal = 19992 + 15
                },
                Step2 = {
                    vLocal = 19992 + 34
                }
            },
            globals = {
                Step1 = {
                    global = 4718592 + 3539
                },
                Step2 = {
                    global = 4718592 + 3540
                },
                Step3 = {
                    global = 4718592 + 3542 + 1
                },
                Step4 = {
                    global = 4718592 + 190507 + 1
                }
            }
        }

        script.locals("fmmc_launcher", Launch.locals.Step1.vLocal).int32 = 1
        script.globals(794954 + 4 + 1 + (script.locals("fmmc_launcher", Launch.locals.Step2.vLocal).int32 * 95) + 75)
            .int32 = 1
        script.globals(Launch.globals.Step1.global).int32 = 1
        script.globals(Launch.globals.Step2.global).int32 = 1
        script.globals(Launch.globals.Step3.global).int32 = 1
        script.globals(Launch.globals.Step4.global).int32 = 0
    end

    local function InstantFinishNew(heistType)
        local Finish = {
            Old = {
                Step1 = {
                    vLocal = 20391 + 1062
                },
                Step2 = {
                    vLocal = 20391 + 1232 + 1
                },
                Step3 = {
                    vLocal = 20391 + 1
                }
            },
            New = {
                Step1 = {
                    vLocal = 54763 + 1589
                },
                Step2 = {
                    vLocal = 54763 + 1776 + 1
                },
                Step3 = {
                    vLocal = 54763 + 1
                }
            }
        }

        local hlist = {CAYO = true, AUTOSHOP = true, AGENCY = true}
        if hlist[heistType] then
            local Script = "fm_mission_controller_2020"
            script.locals(Script, Finish.New.Step1.vLocal).int32 = 5
            script.locals(Script, Finish.New.Step2.vLocal).int32 = 999999
            script.locals(Script, Finish.New.Step3.vLocal).int32 = SetBits(
                script.locals(Script, Finish.New.Step3.vLocal).int32, {9, 16})
        else
            local Script = "fm_mission_controller"
            script.locals(Script, Finish.Old.Step1.vLocal).int32 = 5
            script.locals(Script, Finish.Old.Step2.vLocal).int32 = 999999
            local value = SetBits(script.locals(Script, Finish.Old.Step3.vLocal).int32, {9, 16})
            script.locals(Script, Finish.Old.Step3.vLocal).int32 = value
        end
    end

    local cutPercentages = {}

    for i = 0, 200, 5 do
        table.insert(cutPercentages, {i .. '%', i})
    end

    local Menu = menu.root()

    -- Helper function to create player cut editor
    local function createCutEditor(parentMenu, heistType)
        local cutsMenu = parentMenu:submenu('Player Cut Editor')
        
        local cut_player1 = cutsMenu:combo_int('Player 1 Cut', cutPercentages, 0)
        local cut_player2 = cutsMenu:combo_int('Player 2 Cut', cutPercentages, 0)
        local cut_player3 = cutsMenu:combo_int('Player 3 Cut', cutPercentages, 0)
        local cut_player4 = cutsMenu:combo_int('Player 4 Cut', cutPercentages, 0)

        cutsMenu:button('Apply Cuts'):tooltip(
            'Apply the selected cut percentages to the selected heist.'):event(0, function()
            local success, error = pcall(function()
                local cuts = {cutPercentages[cut_player1.value][2], cutPercentages[cut_player2.value][2],
                            cutPercentages[cut_player3.value][2], cutPercentages[cut_player4.value][2]}
                setCuts(heistType, cuts)
            end)

            if not success then
                log_notify('Error applying cuts: ' .. tostring(error))
                return
            end

            log_notify(string.format('[%s] Cuts set successfully!', heistType))
        end)

        return cutsMenu
    end

    -- APARTMENT HEISTS
    local apartmentMenu = Menu:submenu('Apartment')

    apartmentMenu:button('Unlock All Jobs'):event(0, function()
        account.stats(MPX() .. "HEIST_SAVED_STRAND_0").int32 =
            script.tunables(joaat("ROOT_ID_HASH_THE_FLECCA_JOB")).int32
        account.stats(MPX() .. "HEIST_SAVED_STRAND_0_L").int32 = 5
        account.stats(MPX() .. "HEIST_SAVED_STRAND_1").int32 =
            script.tunables(joaat("ROOT_ID_HASH_THE_PRISON_BREAK")).int32
        account.stats(MPX() .. "HEIST_SAVED_STRAND_1_L").int32 = 5
        account.stats(MPX() .. "HEIST_SAVED_STRAND_2").int32 = script.tunables(
                                                                   joaat("ROOT_ID_HASH_THE_HUMANE_LABS_RAID")).int32
        account.stats(MPX() .. "HEIST_SAVED_STRAND_2_L").int32 = 5
        account.stats(MPX() .. "HEIST_SAVED_STRAND_3").int32 =
            script.tunables(joaat("ROOT_ID_HASH_SERIES_A_FUNDING")).int32
        account.stats(MPX() .. "HEIST_SAVED_STRAND_3_L").int32 = 5
        account.stats(MPX() .. "HEIST_SAVED_STRAND_4").int32 = script.tunables(joaat(
            "ROOT_ID_HASH_THE_PACIFIC_STANDARD_JOB")).int32
        account.stats(MPX() .. "HEIST_SAVED_STRAND_4_L").int32 = 5
        log_notify('All apartment jobs unlocked!')
    end)

    apartmentMenu:button("Complete Preps"):event(0, function()
        account.stats(MPX() .. "HEIST_PLANNING_STAGE").int32 = -1
        util.yield(100)
        ApartmentReloadTable()
        log_notify('Apartment preps completed!')
    end)

    apartmentMenu:button("Reset Preps"):event(0, function()
        account.stats(MPX() .. "HEIST_PLANNING_STAGE").int32 = 0
        util.yield(100)
        ApartmentReloadTable()
        log_notify('Apartment preps reset!')
    end)

    apartmentMenu:button('Solo Launch'):tooltip('Heists will be made launchable with less than min amount of players required')
        :event(0, function()
            SoloLaunch()
            log_notify('Solo launch enabled!')
        end)

    local apartmentCutsMenu = createCutEditor(apartmentMenu, 'APARTMENT')
    
    apartmentCutsMenu:button('Set 3mil Payout Cuts (Pacific Standard)', 1):tooltip(
        "Preset cut, everyone gets $3 Million, Pacific Standard ONLY.\nYou will see 160% cut only for yourself, everyone else will see -540% cut for you but 160% for everyone else.")
        :event(0, function()
            local success, error = pcall(function()
                setCuts('APARTMENT', {160, 160, 160, 160})
            end)

            if not success then
                log_notify('Error applying preset cuts: ' .. tostring(error))
                return
            end

            log_notify("Set payout cuts for players to $3,000,000 each.")
        end)

    apartmentMenu:button('Reset Cooldown'):tooltip("Also allows you to play unavailable heists!"):event(0, function()
        script.globals(1876941 + 1 + (players.me().id * 77) + 76).int32 = -1
        log_notify('Apartment cooldown reset!')
    end)

    local apartmentFinishMenu = apartmentMenu:submenu('Instant Finisher')
    apartmentFinishMenu:button('Instant Finish'):tooltip(
        'Instantly finish heist missions.'):event(0, function()
            local success, error = pcall(function()
                InstantFinishNew('APARTMENT')
            end)
            if not success then
                log_notify('Error applying instant finish: ' .. tostring(error))
                return
            end
            log_notify('Instant finish applied!')
        end)

    -- DIAMOND CASINO
    local diamondMenu = Menu:submenu('Diamond Casino')

    diamondMenu:button('Solo Launch'):tooltip('Heists will be made launchable with less than min amount of players required')
        :event(0, function()
            SoloLaunch()
            log_notify('Solo launch enabled!')
        end)

    local diamondCutsMenu = createCutEditor(diamondMenu, 'DIAMOND')
    
    diamondCutsMenu:button('Set Crew Cut to 1%', 1):event(0, function()
        script.tunables(joaat("CH_LESTER_CUT")).int32 = 1
        script.tunables(joaat("HEIST3_PREPBOARD_GUNMEN_KARL_CUT")).int32 = 1
        script.tunables(joaat("HEIST3_DRIVERS_KARIM_CUT")).int32 = 1
        script.tunables(joaat("HEIST3_HACKERS_AVI_CUT")).int32 = 1
        log_notify('Diamond Crew Cut set to 1%')
    end)

    diamondMenu:button('Bypass Fingerprint/Keypad Hack'):event(0, function()
        if script.locals("fm_mission_controller", 54037).int32 == 4 then
            script.locals("fm_mission_controller", 54037).int32 = 5
            log_notify("Fingerprint hack bypassed.")
        else
            log_notify("Fingerprint hack is not active.")
        end

        if script.locals("fm_mission_controller", 55103).int32 ~= 4 then
            script.locals("fm_mission_controller", 55103).int32 = 5
            log_notify("Keypad hack bypassed.")
        else
            log_notify("Keypad hack is already complete.")
        end
    end)

    local diamondFinishMenu = diamondMenu:submenu('Instant Finisher')
    diamondFinishMenu:button('Instant Finish'):tooltip(
        'Instantly finish heist missions.'):event(0, function()
            local success, error = pcall(function()
                InstantFinishNew('DIAMOND')
            end)
            if not success then
                log_notify('Error applying instant finish: ' .. tostring(error))
                return
            end
            log_notify('Instant finish applied!')
        end)

    -- DOOMSDAY
    local doomsdayMenu = Menu:submenu('Doomsday')

    local doomsdayActsMenu = doomsdayMenu:submenu('Doomsday Acts Progress Setter')

    doomsdayActsMenu:button("Set Act 1 Complete"):event(0, function()
        DoomsdayActSetter(503, 229383)
        log_notify('Doomsday Act 1 set to complete!')
    end)

    doomsdayActsMenu:button("Set Act 2 Complete"):event(0, function()
        DoomsdayActSetter(240, 229378)
        log_notify('Doomsday Act 2 set to complete!')
    end)

    doomsdayActsMenu:button("Set Act 3 Complete"):event(0, function()
        DoomsdayActSetter(16368, 229380)
        log_notify('Doomsday Act 3 set to complete!')
    end)

    doomsdayMenu:button("Complete Preps"):event(0, function()
        account.stats(MPX() .. "GANGOPS_FM_MISSION_PROG").int32 = -1
        DoomsdayReloadTable()
        log_notify('Doomsday preps completed!')
    end)

    doomsdayMenu:button("Reset Preps"):event(0, function()
        DoomsdayActSetter(503, 0)
        DoomsdayReloadTable()
        log_notify('Doomsday preps reset!')
    end)

    doomsdayMenu:button('Solo Launch'):tooltip('Heists will be made launchable with less than min amount of players required')
        :event(0, function()
            SoloLaunch()
            log_notify('Solo launch enabled!')
        end)

    createCutEditor(doomsdayMenu, 'DOOMSDAY')

    doomsdayMenu:button("Act 3 Pass Hack"):event(0, function()
        script.locals("fm_mission_controller", 1294 + 135).int32 = 3
        log_notify('Doomsday Act 3 hack passed!')
    end)

    local doomsdayFinishMenu = doomsdayMenu:submenu('Instant Finisher')
    doomsdayFinishMenu:button('Instant Finish'):tooltip(
        'Instantly finish heist missions.'):event(0, function()
            local success, error = pcall(function()
                InstantFinishNew('DOOMSDAY')
            end)
            if not success then
                log_notify('Error applying instant finish: ' .. tostring(error))
                return
            end
            log_notify('Instant finish applied!')
        end)

    -- CAYO PERICO
    local cayoMenu = Menu:submenu('Cayo Perico')

    cayoMenu:button('Solo Launch'):tooltip('Heists will be made launchable with less than min amount of players required')
        :event(0, function()
            SoloLaunch()
            log_notify('Solo launch enabled!')
        end)

    createCutEditor(cayoMenu, 'CAYO')

    cayoMenu:button("Bypass Fingerprint Hack"):event(0, function()
        script.locals("fm_mission_controller_2020", 25460).int32 = 5
        log_notify("Cayo Perico Fingerprint hack bypassed.")
    end)

    local cayoBagSize = cayoMenu:combo_int('Set Bag Size', {{'1x', 1}, {'2x', 2}, {'3x', 3}, {'4x', 4}, {'5x', 5}}, 1)

    cayoMenu:button("Apply Bag Size"):event(0, function()
        local size = 1800 * cayoBagSize.value
        script.tunables(joaat("HEIST_BAG_MAX_CAPACITY")).int32 = size
        log_notify("Cayo Perico Bag Size set to " .. size)
    end)

    local cayoFinishMenu = cayoMenu:submenu('Instant Finisher')
    cayoFinishMenu:button('Instant Finish'):tooltip(
        'Instantly finish heist missions.'):event(0, function()
            local success, error = pcall(function()
                InstantFinishNew('CAYO')
            end)
            if not success then
                log_notify('Error applying instant finish: ' .. tostring(error))
                return
            end
            log_notify('Instant finish applied!')
        end)

    -- AUTOSHOP
    local autoshopMenu = Menu:submenu('Autoshop')

    autoshopMenu:button('Solo Launch'):tooltip('Heists will be made launchable with less than min amount of players required')
        :event(0, function()
            SoloLaunch()
            log_notify('Solo launch enabled!')
        end)

    createCutEditor(autoshopMenu, 'AUTOSHOP')

    local autoshopFinishMenu = autoshopMenu:submenu('Instant Finisher')
    autoshopFinishMenu:button('Instant Finish'):tooltip(
        'Instantly finish heist missions.'):event(0, function()
            local success, error = pcall(function()
                InstantFinishNew('AUTOSHOP')
            end)
            if not success then
                log_notify('Error applying instant finish: ' .. tostring(error))
                return
            end
            log_notify('Instant finish applied!')
        end)

    -- AGENCY
    local agencyMenu = Menu:submenu('Agency')

    agencyMenu:button('Solo Launch'):tooltip('Heists will be made launchable with less than min amount of players required')
        :event(0, function()
            SoloLaunch()
            log_notify('Solo launch enabled!')
        end)

    createCutEditor(agencyMenu, 'AGENCY')

    local agencyFinishMenu = agencyMenu:submenu('Instant Finisher')
    agencyFinishMenu:button('Instant Finish'):tooltip(
        'Instantly finish heist missions.'):event(0, function()
            local success, error = pcall(function()
                InstantFinishNew('AGENCY')
            end)
            if not success then
                log_notify('Error applying instant finish: ' .. tostring(error))
                return
            end
            log_notify('Instant finish applied!')
        end)

    log_notify('Heist Utils initialized successfully!')
end)

if not success then
    notify.push('[Heist Utils]', 'Error initializing Heist Utils: ' .. tostring(error), 5000)
    print('Error initializing Heist Utils: ' .. tostring(error))
    return
end
