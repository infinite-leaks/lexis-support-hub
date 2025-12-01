-- Silent Night Heists Manager Lexis Port [SKID] { Credits: https://github.com/SilentSalo/SilentNight | https://github.com/xnightli06x/Silent-Night }
-- Ported by @lrxxh & @piuro with the help of: Derkek, melonarmy122
-- Testers: Derkek, 223, camera, Plex, Nexus
-- HAVE FUN
local success, err = pcall(function()

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
        local base = 1931800 + 1
        
        for i, cut in ipairs(cuts) do
            if i == 1 then
                script.globals(base + i).int32 = 100 - (4 * cut)
                script.globals(1933768 + 3008 + 1).int32 = cut
            else
                script.globals(base + i).int32 = cut
            end
        end
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
        script.globals(794954 + 4 + 1 + (script.locals("fmmc_launcher", Launch.locals.Step2.vLocal).int32 * 95) + 75).int32 = 1
        script.globals(Launch.globals.Step1.global).int32 = 1
        script.globals(Launch.globals.Step2.global).int32 = 1
        script.globals(Launch.globals.Step3.global).int32 = 1
        script.globals(Launch.globals.Step4.global).int32 = 0
    end

    local function InstantFinishNew()
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
            }
        }

        local Script = "fm_mission_controller"
        script.locals(Script, Finish.Old.Step1.vLocal).int32 = 5
        script.locals(Script, Finish.Old.Step2.vLocal).int32 = 999999
        local value = SetBits(script.locals(Script, Finish.Old.Step3.vLocal).int32, {9, 16})
        script.locals(Script, Finish.Old.Step3.vLocal).int32 = value
    end

    local cutPercentages = {}

    for i = 0, 200, 5 do
        table.insert(cutPercentages, {i .. '%', i})
    end

    local function createCutEditor(parentMenu, heistType)
        local cutsMenu = parentMenu:submenu('Player Cut Editor')
        
        local cut_player1 = cutsMenu:combo_int('Player 1 Cut', cutPercentages, 0)
        local cut_player2 = cutsMenu:combo_int('Player 2 Cut', cutPercentages, 0)
        local cut_player3 = cutsMenu:combo_int('Player 3 Cut', cutPercentages, 0)
        local cut_player4 = cutsMenu:combo_int('Player 4 Cut', cutPercentages, 0)

        cutsMenu:button('Apply Cuts'):tooltip(
            'Apply the selected cut percentages to the selected heist.'):event(0, function()
            local cut_success, cut_err = pcall(function()
                local cuts = {cutPercentages[cut_player1.value][2], cutPercentages[cut_player2.value][2],
                            cutPercentages[cut_player3.value][2], cutPercentages[cut_player4.value][2]}
                setCuts(heistType, cuts)
            end)

            if not cut_success then
                log_notify('Error applying cuts: ' .. tostring(cut_err))
                return
            end

            log_notify(string.format('[%s] Cuts set successfully!', heistType))
        end)

        return cutsMenu
    end

    -- APARTMENT HEISTS
    local apartmentMenu = menu.root()

    apartmentMenu:button('Unlock All Jobs'):event(0, function()
        account.stats(MPX() .. "HEIST_SAVED_STRAND_0").int32 = script.tunables(joaat("ROOT_ID_HASH_THE_FLECCA_JOB")).int32
        account.stats(MPX() .. "HEIST_SAVED_STRAND_0_L").int32 = 5
        account.stats(MPX() .. "HEIST_SAVED_STRAND_1").int32 = script.tunables(joaat("ROOT_ID_HASH_THE_PRISON_BREAK")).int32
        account.stats(MPX() .. "HEIST_SAVED_STRAND_1_L").int32 = 5
        account.stats(MPX() .. "HEIST_SAVED_STRAND_2").int32 = script.tunables(joaat("ROOT_ID_HASH_THE_HUMANE_LABS_RAID")).int32
        account.stats(MPX() .. "HEIST_SAVED_STRAND_2_L").int32 = 5
        account.stats(MPX() .. "HEIST_SAVED_STRAND_3").int32 = script.tunables(joaat("ROOT_ID_HASH_SERIES_A_FUNDING")).int32
        account.stats(MPX() .. "HEIST_SAVED_STRAND_3_L").int32 = 5
        account.stats(MPX() .. "HEIST_SAVED_STRAND_4").int32 = script.tunables(joaat("ROOT_ID_HASH_THE_PACIFIC_STANDARD_JOB")).int32
        account.stats(MPX() .. "HEIST_SAVED_STRAND_4_L").int32 = 5
        log_notify('All apartment jobs unlocked!')
    end)

    apartmentMenu:button("Complete Preps"):event(0, function()
        account.stats(MPX() .. "HEIST_PLANNING_STAGE").int32 = -1
        util.yield(100)
        ApartmentReloadTable()
        log_notify('Apartment preps completed!')
    end)

    apartmentMenu:button('Reload Table'):tooltip('Reload the planning table for Apartment heists.'):event(0, function()
        ApartmentReloadTable()
        log_notify('Reloaded planning table for Apartment...')
    end)

    apartmentMenu:button("Reset Preps"):event(0, function()
        account.stats(MPX() .. "HEIST_PLANNING_STAGE").int32 = 0
        util.yield(100)
        ApartmentReloadTable()
        log_notify('Apartment preps reset!')
    end)

--[[     apartmentMenu:button('Solo Launch'):tooltip('Heists will be made launchable with less than min amount of players required'):event(0, function()
        SoloLaunch()
        log_notify('Solo launch enabled!')
    end) ]]

    createCutEditor(apartmentMenu, 'APARTMENT')

    apartmentMenu:button('$3Million Pacific Standard'):tooltip("Everyone gets $3 Million, Pacific Standard Only."):event(0, function()
        local cut_success, cut_err = pcall(function()
            setCuts('APARTMENT', {160, 160, 160, 160})
        end)

        if not cut_success then
            log_notify('Error applying preset cuts: ' .. tostring(cut_err))
            return
        end

        log_notify("Set payout cuts for players to $3,000,000 each.")
    end)

--[[     apartmentMenu:button('Reset Cooldown'):tooltip("Also allows you to play unavailable heists!"):event(0, function()
        script.globals(1876941 + 1 + (players.me().id * 77) + 76).int32 = -1
        log_notify('Apartment cooldown reset!')
    end) ]]

    apartmentMenu:button('Instant Finish'):tooltip('Instantly finish heist missions.'):event(0, function()
        local finish_success, finish_err = pcall(function()
            InstantFinishNew()
        end)
        if not finish_success then
            log_notify('Error applying instant finish: ' .. tostring(finish_err))
            return
        end
        log_notify('Instant finish applied!')
    end)

    log_notify('Heist Utils initialized successfully!')
end)

if not success then
    notify.push('[Heist Utils]', 'Error initializing Heist Utils: ' .. tostring(err), 5000)
    print('Error initializing Heist Utils: ' .. tostring(err))
    return
end
