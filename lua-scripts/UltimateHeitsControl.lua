-- HEIST CONTROL ULTIMATE
-- MERGED & UI BY melonarmy122/Danny/Xitz
--(Keybind T + Themes + Payout Info + Memory State)

-----
-- 1. HEIST TOOL LOGIC & HELPERS
-----

-- Helper Functions
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

-- Global Lists
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
local list_fortified_timer = generate_list(0, 1200, 30)

-----
-- 2. UI FRAMEWORK & CONFIG
-----
local OptionType = {
    BUTTON = "button",
    TOGGLE = "toggle",
    NUMBER = "number",
    SELECT = "select",
    SUBMENU = "submenu"
}

-- Configuração inicial
local CONFIG = {
    center_x = 960,
    center_y = 400,
    width = 380,
    item_height = 35,
    header_height = 45,
    footer_height = 30,
    max_visible_items = 14,
    border_thickness = 1,
    scroll_smooth = true,
    current_theme = 1 -- Default Original
}

-- === THEME SYSTEM (25 Cores) ===
local THEMES = {
    {name="1. Original (Preto/Branco)", head=color(50, 50, 50, 255), sel=color(240, 240, 240, 255), txt_sel=color(10, 10, 10, 255)},
    {name="2. Red & Black", head=color(150, 0, 0, 255), sel=color(200, 0, 0, 255), txt_sel=color(255, 255, 255, 255)},
    {name="3. Pink & Black", head=color(200, 0, 150, 255), sel=color(255, 105, 180, 255), txt_sel=color(10, 10, 10, 255)},
    {name="4. Blue & Black", head=color(0, 50, 150, 255), sel=color(0, 100, 255, 255), txt_sel=color(255, 255, 255, 255)},
    {name="5. Green & Black", head=color(0, 100, 0, 255), sel=color(0, 200, 50, 255), txt_sel=color(10, 10, 10, 255)},
    {name="6. Yellow & Black", head=color(180, 180, 0, 255), sel=color(255, 255, 0, 255), txt_sel=color(10, 10, 10, 255)},
    {name="7. Orange & Black", head=color(200, 100, 0, 255), sel=color(255, 140, 0, 255), txt_sel=color(10, 10, 10, 255)},
    {name="8. Purple & Black", head=color(100, 0, 150, 255), sel=color(147, 112, 219, 255), txt_sel=color(255, 255, 255, 255)},
    {name="9. Cyan & Black", head=color(0, 100, 100, 255), sel=color(0, 255, 255, 255), txt_sel=color(10, 10, 10, 255)},
    {name="10. White & Black", head=color(200, 200, 200, 255), sel=color(255, 255, 255, 255), txt_sel=color(0, 0, 0, 255)},
    {name="11. Red & White", head=color(200, 0, 0, 255), sel=color(255, 255, 255, 255), txt_sel=color(200, 0, 0, 255)},
    {name="12. Blue & White", head=color(0, 0, 200, 255), sel=color(255, 255, 255, 255), txt_sel=color(0, 0, 200, 255)},
    {name="13. Green & White", head=color(0, 150, 0, 255), sel=color(255, 255, 255, 255), txt_sel=color(0, 150, 0, 255)},
    {name="14. Midnight Blue", head=color(25, 25, 112, 255), sel=color(65, 105, 225, 255), txt_sel=color(255, 255, 255, 255)},
    {name="15. Maroon", head=color(128, 0, 0, 255), sel=color(165, 42, 42, 255), txt_sel=color(255, 255, 255, 255)},
    {name="16. Gold Luxury", head=color(184, 134, 11, 255), sel=color(255, 215, 0, 255), txt_sel=color(0, 0, 0, 255)},
    {name="17. Silver", head=color(112, 128, 144, 255), sel=color(192, 192, 192, 255), txt_sel=color(0, 0, 0, 255)},
    {name="18. Teal", head=color(0, 128, 128, 255), sel=color(64, 224, 208, 255), txt_sel=color(0, 0, 0, 255)},
    {name="19. Lime Acid", head=color(50, 205, 50, 255), sel=color(0, 255, 0, 255), txt_sel=color(0, 0, 0, 255)},
    {name="20. Hot Pink", head=color(199, 21, 133, 255), sel=color(255, 20, 147, 255), txt_sel=color(255, 255, 255, 255)},
    {name="21. Indigo", head=color(75, 0, 130, 255), sel=color(138, 43, 226, 255), txt_sel=color(255, 255, 255, 255)},
    {name="22. Chocolate", head=color(139, 69, 19, 255), sel=color(210, 105, 30, 255), txt_sel=color(255, 255, 255, 255)},
    {name="23. Slate Gray", head=color(47, 79, 79, 255), sel=color(119, 136, 153, 255), txt_sel=color(0, 0, 0, 255)},
    {name="24. Crimson", head=color(220, 20, 60, 255), sel=color(255, 99, 71, 255), txt_sel=color(255, 255, 255, 255)},
    {name="25. Matrix", head=color(0, 50, 0, 255), sel=color(0, 255, 0, 255), txt_sel=color(0, 0, 0, 255)},
}

-- Colors (THEME: Default is Index 1)
local COLORS = {
    background = color(10, 10, 10, 250),
    header_bg = color(50, 50, 50, 255),
    selection_bg = color(240, 240, 240, 255),
    hover_bg = color(40, 40, 40, 120),
    border = color(255, 255, 255, 40),
    separator = color(100, 100, 100, 255),
    
    text_header = color(255, 255, 255, 255),
    text_normal = color(220, 220, 220, 255),
    text_selected = color(10, 10, 10, 255),
    text_disabled = color(100, 100, 100, 255),
    text_accent = color(180, 180, 180, 255),
    
    slider_bg = color(40, 40, 40, 255),
    slider_fill = color(200, 200, 200, 255)
}

local function ApplyTheme(index)
    if index < 1 or index > #THEMES then index = 1 end
    CONFIG.current_theme = index
    local t = THEMES[index]
    COLORS.header_bg = t.head
    COLORS.selection_bg = t.sel
    COLORS.text_selected = t.txt_sel
end

-- Controls
local CONTROLS = {
    TOGGLE_MENU = 245,  -- TECLA T (Código 245 = MP_TEXT_CHAT_ALL)
    NAVIGATE_UP = 172,  -- Seta Cima
    NAVIGATE_DOWN = 173, -- Seta Baixo
    NAVIGATE_LEFT = 174, -- Seta Esquerda
    NAVIGATE_RIGHT = 175, -- Seta Direita
    SELECT = 176,       -- Enter
    BACK = 177          -- Backspace
}

-- Classes
local Option = {}
Option.__index = Option
function Option.new(type, name, description)
    local self = setmetatable({}, Option)
    self.type = type; self.name = name; self.description = description or ""; self.visible = true; return self
end
function Option.button(name, desc, cb) local o=Option.new("button", name, desc); o.callback=cb or function() end; return o end
function Option.toggle(name, desc, def, cb) local o=Option.new("toggle", name, desc); o.value=def or false; o.callback=cb or function() end; return o end
function Option.number(name, desc, def, min, max, step, cb, style) local o=Option.new("number", name, desc); o.value=def or min; o.min=min; o.max=max; o.step=step; o.style=style or "slider"; o.callback=cb or function() end; return o end
function Option.select(name, desc, opts, idx, cb) local o=Option.new("select", name, desc); o.options=opts or {}; o.index=idx or 1; o.callback=cb or function() end; return o end
function Option.submenu(name, desc, sub) local o=Option.new("submenu", name, desc); o.submenu=sub; return o end

local Menu = {}
Menu.__index = Menu
function Menu.new(title)
    local self = setmetatable({}, Menu)
    self.title = title; self.options = {}; self.selected_index = 1; self.scroll_offset = 0; self.parent = nil; return self
end
function Menu:add(opt) table.insert(self.options, opt); return self end
function Menu:add_button(n, d, c) return self:add(Option.button(n, d, c)) end
function Menu:add_number(n, d, def, min, max, step, c, s) return self:add(Option.number(n, d, def, min, max, step, c, s)) end
function Menu:add_select(n, d, opts, idx, c) return self:add(Option.select(n, d, opts, idx, c)) end
function Menu:add_submenu(n, d, sub) sub.parent = self; return self:add(Option.submenu(n, d, sub)) end
function Menu:get_visible_options() local v={}; for _,o in ipairs(self.options) do if o.visible then table.insert(v, o) end end; return v end
function Menu:get_selected() return self:get_visible_options()[self.selected_index] end
function Menu:navigate(dir)
    local vis = self:get_visible_options(); local len = #vis; if len == 0 then return end
    self.selected_index = self.selected_index + dir
    if self.selected_index < 1 then self.selected_index = len elseif self.selected_index > len then self.selected_index = 1 end
    local max = CONFIG.max_visible_items
    if self.selected_index > self.scroll_offset + max then self.scroll_offset = self.selected_index - max
    elseif self.selected_index <= self.scroll_offset then self.scroll_offset = self.selected_index - 1 end
end

local MenuSystem = { active = false, current = nil, root = nil, stack = {} }

function MenuSystem.open() 
    MenuSystem.active = true
    -- MODIFICADO: Só reseta para o inicio se for a PRIMEIRA vez (current == nil).
    -- Se já tiver um "current", ele mantém onde estava.
    if MenuSystem.current == nil then
        MenuSystem.current = MenuSystem.root
        MenuSystem.stack = {}
    end
end

function MenuSystem.close() 
    MenuSystem.active = false
    -- Nota: Não resetamos o stack/current aqui, para manter a memória.
end

function MenuSystem.forward(sub) table.insert(MenuSystem.stack, MenuSystem.current); MenuSystem.current = sub; sub.selected_index=1; sub.scroll_offset=0 end
function MenuSystem.back() if #MenuSystem.stack > 0 then MenuSystem.current = table.remove(MenuSystem.stack) else MenuSystem.close() end end

-- Saving System
local function SaveConfig()
    local file = io.open("heist_config.txt", "w")
    if file then
        file:write("x=" .. tostring(CONFIG.center_x) .. "\n")
        file:write("y=" .. tostring(CONFIG.center_y) .. "\n")
        file:write("theme=" .. tostring(CONFIG.current_theme) .. "\n") -- Save Theme
        file:close()
        notify.push("Settings", "Position & Theme Saved!", 2000)
    else
        notify.push("Settings", "Failed to save file", 2000)
    end
end

local function LoadConfig()
    local file = io.open("heist_config.txt", "r")
    if file then
        for line in file:lines() do
            local k, v = line:match("(%w+)=(%d+)")
            if k == "x" then CONFIG.center_x = tonumber(v) end
            if k == "y" then CONFIG.center_y = tonumber(v) end
            if k == "theme" then ApplyTheme(tonumber(v)) end -- Load Theme
        end
        file:close()
    else
        ApplyTheme(1) -- Default
    end
end

-----
-- UTILITÁRIOS & INPUT FIX (Cutscene Fix)
-----
local Utils = {}

function Utils.pressed(g, c) 
    -- FIX CUTSCENE: Usamos a native 0x91AEF906BCA88877 que foi usada no seu outro script.
    -- Ela força a leitura da tecla mesmo que o jogo esteja em cutscene ou carregamento.
    if invoker.call(0x91AEF906BCA88877, g, c).bool then return true end
    
    -- Fallback para leitura normal se necessário
    if invoker.call(0x580417101DDB492F, g, c).bool then return true end
    
    return false 
end

function Utils.disable_game_controls()
    -- Bloqueio seletivo para não interferir na cutscene mas impedir movimento indesejado no menu
    local controls_to_block = {
        27,  -- Phone Up
        30, 31, 32, 33, 34, 35, -- Movimentação (WASD)
        24, 257, -- Ataque/Tiro
        44, -- Cover
        0, 1, 2, -- Camera
        245 -- FIX T: Bloqueia "MP TEXT CHAT ALL" para não abrir o chat quando usar o menu
    }
    
    for _, c in ipairs(controls_to_block) do
        invoker.call(0xFE99B66D079CF6BC, 0, c, true)
    end
end

function Utils.wrap(text, max)
    local lines={}; local line=""; for w in text:gmatch("%S+") do
        if #line+#w+1 <= max then line = line=="" and w or line.." "..w else table.insert(lines, line); line=w end
    end; if line~="" then table.insert(lines, line) end; return lines
end

local Renderer = {}
function Renderer.rect(x, y, w, h, c, b)
    if c then gui.rect(vec2(x,y), vec2(w,h)):color(c):filled():draw() end
    if b then gui.rect(vec2(x,y), vec2(w,h)):outline(CONFIG.border_thickness, b):draw() end
end
function Renderer.text(t, x, y, c) gui.text(t):position(vec2(x,y)):color(c):draw() end
function Renderer.draw_menu()
    if not MenuSystem.active or not MenuSystem.current then return end
    local m = MenuSystem.current; local vis = m:get_visible_options()
    local b = {x = CONFIG.center_x - CONFIG.width/2, y = CONFIG.center_y - (CONFIG.header_height + math.min(#vis, CONFIG.max_visible_items)*CONFIG.item_height + CONFIG.footer_height)/2, w = CONFIG.width}
    
    -- Header
    Renderer.rect(b.x, b.y, b.w, CONFIG.header_height, COLORS.header_bg, nil)
    Renderer.text(m.title, b.x+10, b.y+10, COLORS.text_header)
    if m.parent then Renderer.text("<", b.x+b.w-20, b.y+10, COLORS.text_accent) end

    -- Items
    local start_y = b.y + CONFIG.header_height
    local show_cnt = math.min(#vis, CONFIG.max_visible_items)
    Renderer.rect(b.x, start_y, b.w, show_cnt*CONFIG.item_height, COLORS.background, COLORS.border)
    
    for i = 1, show_cnt do
        local idx = m.scroll_offset + i
        if idx > #vis then break end
        local opt = vis[idx]; local sel = (idx == m.selected_index)
        local iy = start_y + (i-1)*CONFIG.item_height
        
        if sel then Renderer.rect(b.x, iy, b.w, CONFIG.item_height, COLORS.selection_bg, nil) end
        Renderer.text(opt.name, b.x+10, iy+8, sel and COLORS.text_selected or COLORS.text_normal)
        
        -- Right side values
        local rx = b.x + b.w - 10
        if opt.type == "submenu" then Renderer.text(">", rx-10, iy+8, sel and COLORS.text_selected or COLORS.text_accent)
        elseif opt.type == "toggle" then 
            local tc = opt.value and (sel and COLORS.text_selected or COLORS.text_accent) or COLORS.text_disabled
            Renderer.text(opt.value and "ON" or "OFF", rx-30, iy+8, tc)
        elseif opt.type == "select" or opt.type == "number" then
            local val = opt.type=="select" and (type(opt.options[opt.index])=="table" and opt.options[opt.index].name or opt.options[opt.index][1]) or opt.value
            local t = "< " .. tostring(val) .. " >"
            Renderer.text(t, rx - (#t*7), iy+8, sel and COLORS.text_selected or COLORS.text_normal)
        end
    end

    -- Footer
    local fy = start_y + show_cnt*CONFIG.item_height
    Renderer.rect(b.x, fy, b.w, CONFIG.footer_height, COLORS.header_bg, nil)
    Renderer.text("melonarmy122/Danny/Xitz", b.x+10, fy+8, COLORS.text_disabled)
    Renderer.text(m.selected_index.."/"..#vis, b.x+b.w-40, fy+8, COLORS.text_disabled)
end

local Input = {}
function Input.process()
    -- Toggle Menu (TECLA T - Detecta mesmo em cutscene)
    if Utils.pressed(0, CONTROLS.TOGGLE_MENU) then 
        if MenuSystem.active then MenuSystem.close() else MenuSystem.open() end 
        -- Pequeno delay para evitar spam
        util.yield(200)
    end
    
    if not MenuSystem.active then return end
    
    -- Bloqueio de teclas do jogo para não atrapalhar o menu
    Utils.disable_game_controls()

    local m = MenuSystem.current; local sel = m:get_selected()
    if Utils.pressed(0, CONTROLS.NAVIGATE_UP) then m:navigate(-1) end
    if Utils.pressed(0, CONTROLS.NAVIGATE_DOWN) then m:navigate(1) end
    if Utils.pressed(0, CONTROLS.BACK) then MenuSystem.back() end
    
    if sel then
        if Utils.pressed(0, CONTROLS.SELECT) then
            if sel.type == "button" then sel.callback()
            elseif sel.type == "toggle" then sel.value = not sel.value; sel.callback(sel.value)
            elseif sel.type == "submenu" then MenuSystem.forward(sel.submenu) end
        end
        if sel.type == "select" or sel.type == "number" then
            local dir = 0
            if Utils.pressed(0, CONTROLS.NAVIGATE_LEFT) then dir = -1 elseif Utils.pressed(0, CONTROLS.NAVIGATE_RIGHT) then dir = 1 end
            if dir ~= 0 then
                if sel.type == "select" then
                    sel.index = sel.index + dir
                    if sel.index < 1 then sel.index = #sel.options elseif sel.index > #sel.options then sel.index = 1 end
                    sel.callback(sel.options[sel.index], sel.index)
                elseif sel.type == "number" then
                    sel.value = sel.value + (sel.step * dir)
                    if sel.value < sel.min then sel.value = sel.min elseif sel.value > sel.max then sel.value = sel.max end
                    sel.callback(sel.value)
                end
            end
        end
    end
end

-----
-- 3. MENU CONSTRUCTION
-----
local function CreateHeistMenu()
    local root = Menu.new("Heist Control Ultimate")
    
    -- === HELPER: SHOW LIMIT ===
    local function ShowLimit(title, msg)
        notify.push(title, msg, 5000)
    end

    -- === PAYOUT LIMITS INFO (REQUESTED) ===
    local info_menu = Menu.new("Payout Limits Info")
    info_menu:add_button("Apartment / Classic", "Click to see limit", function() ShowLimit("Classic Heists", "$3,000,000 per player") end)
    info_menu:add_button("Cayo Perico", "Click to see limit", function() ShowLimit("Cayo Perico", "$2,550,000 per player") end)
    info_menu:add_button("Diamond Casino", "Click to see limit", function() ShowLimit("Diamond Casino", "$3,625,000 per player") end)
    info_menu:add_button("Doomsday Heist", "Click to see limit", function() ShowLimit("Doomsday", "$2,550,000 per player") end)
    info_menu:add_button("Agency (Dr. Dre)", "Click to see limit", function() ShowLimit("Agency", "$2,500,000 fixed") end)
    info_menu:add_button("Auto Shop / Tuners", "Click to see limit", function() ShowLimit("Auto Shop", "$2,200,000 fixed") end)
    
    -- === SETTINGS SUBMENU (Modified with Colors) ===
    local settings_menu = Menu.new("Settings")
    settings_menu:add_number("Menu X Position", "Left/Right", CONFIG.center_x, 0, 1920, 10, function(v) CONFIG.center_x = v end)
    settings_menu:add_number("Menu Y Position", "Up/Down", CONFIG.center_y, 0, 1080, 10, function(v) CONFIG.center_y = v end)
    
    -- Opção de Mudar Cor (Theme)
    settings_menu:add_select("Menu Theme", "Select Color", THEMES, CONFIG.current_theme, function(v, idx) ApplyTheme(idx) end)
    
    settings_menu:add_button("Save Settings", "Saves Pos & Color", function() SaveConfig() end)
    
    -- === CLASSIC HEIST (APARTMENT) ===
    local classic_menu = Menu.new("Classic Heists")
    
    -- Classic Payouts/Cuts
    local classic_cuts = Menu.new("Heist Cuts")
    local c_cuts_val = {100, 0, 0, 0}
    
    local function apply_classic_cuts()
        local base_global = 1936013
        local base_local = 1937981 + 3008
        local total_cut = c_cuts_val[1] + c_cuts_val[2] + c_cuts_val[3] + c_cuts_val[4]
        local over_cap = total_cut - 100
        if over_cap > 0 then script.globals(base_global + 2).int32 = -over_cap else script.globals(base_global + 2).int32 = 0 end
        script.globals(base_global + 3).int32 = c_cuts_val[2]
        script.globals(base_global + 4).int32 = c_cuts_val[3]
        script.globals(base_global + 5).int32 = c_cuts_val[4]
        script.globals(base_local + 1).int32 = c_cuts_val[1]
        script.globals(base_local + 2).int32 = c_cuts_val[2]
        script.globals(base_local + 3).int32 = c_cuts_val[3]
        script.globals(base_local + 4).int32 = c_cuts_val[4]
    end

    classic_cuts:add_number("Host Cut %", "", 100, 0, 1490, 5, function(v) c_cuts_val[1] = v end)
    classic_cuts:add_number("Player 2 Cut %", "", 0, 0, 1490, 5, function(v) c_cuts_val[2] = v end)
    classic_cuts:add_number("Player 3 Cut %", "", 0, 0, 1490, 5, function(v) c_cuts_val[3] = v end)
    classic_cuts:add_number("Player 4 Cut %", "", 0, 0, 1490, 5, function(v) c_cuts_val[4] = v end)
    classic_cuts:add_button("Apply Custom Cuts", "", apply_classic_cuts)

    local classic_presets = Menu.new("Automated Presets")
    local function set_classic_preset(amt) for i=1,4 do c_cuts_val[i] = amt end; apply_classic_cuts() end
    classic_presets:add_button("Max Payout Fleeca (1490%)", "", function() set_classic_preset(1490) end)
    classic_presets:add_button("Max Payout Prison (429%)", "", function() set_classic_preset(429) end)
    classic_presets:add_button("Max Payout Humane (317%)", "", function() set_classic_preset(317) end)
    classic_presets:add_button("Max Payout Series A (424%)", "", function() set_classic_preset(424) end)
    classic_presets:add_button("Max Payout Pacific (160%)", "", function() set_classic_preset(160) end)
    
    classic_cuts:add_submenu("Automated Presets", "", classic_presets)
    classic_cuts:add_button("Force Ready", "", function() for i = 1, 4 do script.globals(2658294 + 1 + ((i - 1) * 468) + 221).int32 = 6 end end)

    -- Classic Preps
    local classic_preps = Menu.new("Prep Options")
    classic_preps:add_button("Unlock All Apartment Jobs", "Run this if locked", function()
        local fleeca_id = script.tunables("ROOT_ID_HASH_THE_FLECCA_JOB").int32
        local prison_id = script.tunables("ROOT_ID_HASH_THE_PRISON_BREAK").int32
        local humane_id = script.tunables("ROOT_ID_HASH_THE_HUMANE_LABS_RAID").int32
        local series_a_id = script.tunables("ROOT_ID_HASH_SERIES_A_FUNDING").int32
        local pacific_id = script.tunables("ROOT_ID_HASH_THE_PACIFIC_STANDARD_JOB").int32
        account.stats("MP0_HEIST_SAVED_STRAND_0").int32 = fleeca_id; account.stats("MP0_HEIST_SAVED_STRAND_0_L").int32 = 5
        account.stats("MP0_HEIST_SAVED_STRAND_1").int32 = prison_id; account.stats("MP0_HEIST_SAVED_STRAND_1_L").int32 = 5
        account.stats("MP0_HEIST_SAVED_STRAND_2").int32 = humane_id; account.stats("MP0_HEIST_SAVED_STRAND_2_L").int32 = 5
        account.stats("MP0_HEIST_SAVED_STRAND_3").int32 = series_a_id; account.stats("MP0_HEIST_SAVED_STRAND_3_L").int32 = 5
        account.stats("MP0_HEIST_SAVED_STRAND_4").int32 = pacific_id; account.stats("MP0_HEIST_SAVED_STRAND_4_L").int32 = 5
    end)
    classic_preps:add_button("Skip Classic Heist Preps", "", function() account.stats("MP0_HEIST_PLANNING_STAGE").int32 = -1; account.stats("MP1_HEIST_PLANNING_STAGE").int32 = -1 end)
    classic_preps:add_button("Redraw Heist Board", "", function() script.globals(1936048).int32 = 22 end)

    -- Classic Tools
    local classic_tools = Menu.new("Classic Tools")
    classic_tools:add_button("Max Payout Info (3M)", "Just info", function() end)
    classic_tools:add_button("Bypass Fleeca Hack", "", function() script.locals("fm_mission_controller", 12247).int32 = 7 end)
    classic_tools:add_button("Instant Drill", "", function() script.locals("fm_mission_controller", 10511 + 11).float = 1.0 end)
    classic_tools:add_button("Bypass Pacific Hack", "", function() script.locals("fm_mission_controller", 10215).int32 = 9 end)
    classic_tools:add_button("Kill Cooldown", "", function() local pid = players.me().id; script.globals(1877303 + 1 + (pid * 77) + 76).int32 = -1 end)
    classic_tools:add_button("Set Team Lives to 100", "", function() script.locals("fm_mission_controller", 22126).int32 = -100 end)
    classic_tools:add_button("Instant Finish (Pacific)", "", function()
        script.locals("fm_mission_controller", 22126).int32 = 10; script.locals("fm_mission_controller", 20395 + 1062).int32 = 5
        script.locals("fm_mission_controller", 20395 + 1740 + 1).int32 = 80; script.locals("fm_mission_controller", 20395 + 2686).int32 = 10000000
        script.locals("fm_mission_controller", 29016 + 1).int32 = 99999; script.locals("fm_mission_controller", 32472 + 1 + 68).int32 = 99999
    end)
    classic_tools:add_button("Instant Finish (Others)", "", function()
        script.locals("fm_mission_controller", 20395).int32 = 12; script.locals("fm_mission_controller", 29016 + 1).int32 = 99999; script.locals("fm_mission_controller", 32472 + 1 + 68).int32 = 99999
    end)

    classic_menu:add_submenu("Preps & Unlock", "", classic_preps)
    classic_menu:add_submenu("Cuts", "", classic_cuts)
    classic_menu:add_submenu("Tools", "", classic_tools)

    -- === CAYO PERICO ===
    local cayo_menu = Menu.new("Cayo Perico")
    
    local cayo_preps = Menu.new("Cayo Preps")
    cayo_preps:add_button("Unlock All POI", "", function()
        for i=0,1 do local p="MP"..i.."_"; account.stats(p.."H4CNF_BS_GEN").int32=-1; account.stats(p.."H4CNF_BS_ENTR").int32=63; account.stats(p.."H4CNF_BS_ABIL").int32=63; account.stats(p.."H4CNF_APPROACH").int32=-1; account.stats(p.."H4_PLAYTHROUGH_STATUS").int32=10 end; script.locals("heist_island_planning", 1570).int32=2
    end)
    
    local c_cfg = { diff=126823, app=65535, wep=1, tgt=5, sec_comp="GOLD", sec_isl="GOLD", amt_comp=255, amt_isl=16777215, paint=127, val_cash=83250, val_weed=135000, val_coke=202500, val_gold=333333, val_art=180000 }
    
    cayo_preps:add_select("Difficulty", "", {{name="Normal", index=126823}, {name="Hard", index=131055}}, 1, function(v) c_cfg.diff=v.index end)
    cayo_preps:add_select("Approach", "", {{name="Sub", index=65283}, {name="Longfin", index=65345}, {name="All", index=65535}}, 3, function(v) c_cfg.app=v.index end)
    cayo_preps:add_select("Target", "", {{name="Tequila", index=0}, {name="Necklace", index=1}, {name="Bonds", index=2}, {name="Diamond", index=3}, {name="Files", index=4}, {name="Panther", index=5}}, 6, function(v) c_cfg.tgt=v.index end)
    cayo_preps:add_select("Compound Loot", "", {{name="Gold", index="GOLD"}, {name="Coke", index="COKE"}, {name="Cash", index="CASH"}}, 1, function(v) c_cfg.sec_comp=v.index end)
    cayo_preps:add_select("Island Loot", "", {{name="Gold", index="GOLD"}, {name="Coke", index="COKE"}}, 1, function(v) c_cfg.sec_isl=v.index end)
    
    cayo_preps:add_button("APPLY PREPS", "Click to set heist", function()
        local p = "MP"..script.globals(1574927).int32.."_"
        account.stats(p.."H4_PROGRESS").int32 = c_cfg.diff
        account.stats(p.."H4_MISSIONS").int32 = c_cfg.app
        account.stats(p.."H4CNF_WEAPONS").int32 = c_cfg.wep
        account.stats(p.."H4CNF_TARGET").int32 = c_cfg.tgt
        local loots = {"CASH", "WEED", "COKE", "GOLD"}
        for _, l in ipairs(loots) do
            local val = (c_cfg.sec_comp == l) and c_cfg.amt_comp or 0
            account.stats(p.."H4LOOT_"..l.."_C").int32 = val; account.stats(p.."H4LOOT_"..l.."_C_SCOPED").int32 = val
            local val2 = (c_cfg.sec_isl == l) and c_cfg.amt_isl or 0
            account.stats(p.."H4LOOT_"..l.."_I").int32 = val2; account.stats(p.."H4LOOT_"..l.."_I_SCOPED").int32 = val2
            local money = (l=="CASH" and c_cfg.val_cash) or (l=="WEED" and c_cfg.val_weed) or (l=="COKE" and c_cfg.val_coke) or (l=="GOLD" and c_cfg.val_gold) or 0
            account.stats(p.."H4LOOT_"..l.."_V").int32 = money
        end
        account.stats(p.."H4LOOT_PAINT").int32 = c_cfg.paint; account.stats(p.."H4LOOT_PAINT_SCOPED").int32 = c_cfg.paint; account.stats(p.."H4LOOT_PAINT_V").int32 = c_cfg.val_art
        script.locals("heist_island_planning", 1570).int32 = 2
    end)
    cayo_preps:add_button("Reset Preps", "", function() 
        local p="MP"..script.globals(1574927).int32.."_"; account.stats(p.."H4_PROGRESS").int32=0; account.stats(p.."H4_MISSIONS").int32=0; account.stats(p.."H4CNF_TARGET").int32=-1; script.locals("heist_island_planning", 1570).int32=2 
    end)

    local cayo_cuts = Menu.new("Cayo Cuts")
    local cc_val = {100, 100, 100, 100}
    cayo_cuts:add_number("Host Cut", "", 100, 15, 1000, 5, function(v) cc_val[1]=v end)
    cayo_cuts:add_number("P2 Cut", "", 100, 15, 1000, 5, function(v) cc_val[2]=v end)
    cayo_cuts:add_number("P3 Cut", "", 100, 15, 1000, 5, function(v) cc_val[3]=v end)
    cayo_cuts:add_number("P4 Cut", "", 100, 15, 1000, 5, function(v) cc_val[4]=v end)
    cayo_cuts:add_button("Apply Cuts", "", function() local b=1980034+831+56; for i=1,4 do script.globals(b+i).int32=cc_val[i] end end)
    cayo_cuts:add_button("Force Ready", "", function() for i=0,3 do script.globals(2640831+1+(i*27)+7+i+1).int32=1 end end)

    local cayo_tools = Menu.new("Cayo Tools")
    cayo_tools:add_button("Reload Planning", "", function() script.locals("heist_island_planning", 1570).int32 = 2 end)
    cayo_tools:add_button("Instant Voltlab", "", function() if script.running("fm_content_island_heist") then script.locals("fm_content_island_heist", 795).int32=3 end end)
    cayo_tools:add_button("Instant Password", "", function() script.locals("fm_mission_controller_2020", 26486).int32 = 5 end)
    cayo_tools:add_button("Bypass Cutter", "", function() script.locals("fm_mission_controller_2020", 32592).float = 100.0 end)
    cayo_tools:add_button("Remove Solo Cooldown", "", function() local p="MP"..script.globals(1574927).int32.."_"; account.stats(p.."H4_TARGET_POSIX").int32=1659643454; account.stats(p.."H4_COOLDOWN").int32=0 end)
    cayo_tools:add_button("Instant Finish", "", function() script.locals("fm_mission_controller_2020", 56223).int32=9; script.locals("fm_mission_controller_2020", 56223+1776+1).int32=50 end)

    cayo_menu:add_submenu("Preps", "", cayo_preps)
    cayo_menu:add_submenu("Cuts", "", cayo_cuts)
    cayo_menu:add_submenu("Tools", "", cayo_tools)

    -- === CASINO HEIST ===
    local casino_menu = Menu.new("Casino Heist")
    local cas_presets = Menu.new("Casino Presets")
    
    local function set_cas_app(app, hack)
        local p0="MP0_"; local p1="MP1_"
        account.stats(p0.."H3OPT_APPROACH").int32=app; account.stats(p1.."H3OPT_APPROACH").int32=app
        account.stats(p0.."H3OPT_TARGET").int32=3; account.stats(p1.."H3OPT_TARGET").int32=3
        account.stats(p0.."H3OPT_ACCESSPOINTS").int32=2047; account.stats(p0.."H3OPT_BITSET1").int32=-1
        if hack then script.locals("gb_casino_heist_planning", 210+hack).int32=2 end
    end
    cas_presets:add_button("Silent & Sneaky", "", function() set_cas_app(1, 0) end)
    cas_presets:add_button("Big Con", "", function() set_cas_app(2, 2) end)
    cas_presets:add_button("Aggressive", "", function() set_cas_app(3, 2) end)
    cas_presets:add_button("Reset Preps", "", function() account.stats("MP0_H3OPT_APPROACH").int32=0; account.stats("MP0_H3OPT_TARGET").int32=0 end)
    
    local cas_cuts = Menu.new("Casino Cuts")
    local cas_c_val = {100, 100, 100, 100}
    cas_cuts:add_number("Host %", "", 100, 15, 1000, 5, function(v) cas_c_val[1]=v end)
    cas_cuts:add_number("P2 %", "", 100, 15, 1000, 5, function(v) cas_c_val[2]=v end)
    cas_cuts:add_number("P3 %", "", 100, 15, 1000, 5, function(v) cas_c_val[3]=v end)
    cas_cuts:add_number("P4 %", "", 100, 15, 1000, 5, function(v) cas_c_val[4]=v end)
    cas_cuts:add_button("Apply Cuts", "", function() local b=1973230+1497+736+92; for i=1,4 do script.globals(b+i).int32=cas_c_val[i] end end)
    cas_cuts:add_button("Force Ready", "", function() for i=0,3 do script.globals(1977593+1+(i*68)+7+i+1).int32=1 end end)

    local cas_tools = Menu.new("Casino Tools")
    cas_tools:add_button("Skip Arcade Setup", "", function() account.stats(27227, 1).bool=true; account.stats(27227, 0).bool=true end)
    cas_tools:add_button("Fingerprint Hack", "", function() local v=script.locals("fm_mission_controller", 54042).int32; if (v&1)==0 then script.locals("fm_mission_controller", 54042).int32=v|1 end end)
    cas_tools:add_button("Instant Drill", "", function() script.locals("fm_mission_controller", 10551+2).int32=7; script.locals("fm_mission_controller", 10551).int32=script.locals("fm_mission_controller", 10551).int32|(1<<12) end)
    cas_tools:add_button("Remove Cooldown", "", function() account.stats("MP0_H3_COMPLETEDPOSIX").int32=-1; account.stats("MP0_MPPLY_H3_COOLDOWN").int32=-1 end)
    cas_tools:add_button("Instant Finish", "", function() script.locals("fm_mission_controller", 22126).int32=10; script.locals("fm_mission_controller", 20395+1740+1).int32=80; script.locals("fm_mission_controller", 20395).int32=12 end)

    casino_menu:add_submenu("Presets", "", cas_presets)
    casino_menu:add_submenu("Cuts", "", cas_cuts)
    casino_menu:add_submenu("Tools", "", cas_tools)

    -- === DOOMSDAY ===
    local dooms_menu = Menu.new("Doomsday Heist")
    local d_presets = Menu.new("Doomsday Presets")
    local function set_dooms(prog) account.stats("MP0_GANGOPS_FLOW_MISSION_PROG").int32=prog; account.stats("MP0_GANGOPS_HEIST_STATUS").int32=-229383; script.locals("gb_gang_ops_planning", 211).int32=6 end
    d_presets:add_button("Act I: Data Breaches", "", function() set_dooms(503) end)
    d_presets:add_button("Act II: Bogdan", "", function() set_dooms(240) end)
    d_presets:add_button("Act III: Doomsday", "", function() set_dooms(16368) end)
    d_presets:add_button("Reset", "", function() set_dooms(503); account.stats("MP0_GANGOPS_HEIST_STATUS").int32=0 end)

    local d_cuts = Menu.new("Doomsday Cuts")
    local dc_val = {100, 100, 100, 100}
    d_cuts:add_number("Host %", "", 100, 15, 1000, 5, function(v) dc_val[1]=v end)
    d_cuts:add_number("P2 %", "", 100, 15, 1000, 5, function(v) dc_val[2]=v end)
    d_cuts:add_number("P3 %", "", 100, 15, 1000, 5, function(v) dc_val[3]=v end)
    d_cuts:add_number("P4 %", "", 100, 15, 1000, 5, function(v) dc_val[4]=v end)
    d_cuts:add_button("Apply Cuts", "", function() local b=1969405; for i=1,4 do script.globals(b+i).int32=dc_val[i] end end)
    d_cuts:add_button("Force Ready", "", function() for i=0,3 do script.globals(1882717+1+(i*315)+54+i).int32=1 end end)

    local d_tools = Menu.new("Doomsday Tools")
    d_tools:add_button("Bypass Hack (Act 1)", "", function() script.locals("fm_mission_controller", 1541).int32=2 end)
    d_tools:add_button("Bypass Hack (Act 3)", "", function() script.locals("fm_mission_controller", 1435).int32=3 end)
    d_tools:add_button("Instant Finish (Act 1/2)", "", function() script.locals("fm_mission_controller", 22126).int32=10; script.locals("fm_mission_controller", 20395+1725+1).int32=13000000; script.locals("fm_mission_controller", 20395).int32=12 end)
    d_tools:add_button("Instant Finish (Act 3)", "", function() script.locals("fm_mission_controller", 22126).int32=10; script.locals("fm_mission_controller", 20395+1740+1).int32=13000000; script.locals("fm_mission_controller", 20395).int32=12 end)

    dooms_menu:add_submenu("Presets", "", d_presets)
    dooms_menu:add_submenu("Cuts", "", d_cuts)
    dooms_menu:add_submenu("Tools", "", d_tools)

    -- === OTHERS (Agency, Auto Shop, etc.) ===
    local agency_menu = Menu.new("Agency")
    local ag_con = 1
    agency_menu:add_select("Contract", "", {{name="Nightclub", index=4}, {name="Dre", index=4095}}, 1, function(v) ag_con=v.index end)
    agency_menu:add_button("Set Contract", "", function() account.stats("MP0_FIXER_STORY_BS").int32=ag_con; account.stats("MP0_FIXER_STORY_STRAND").int32=2 end)
    agency_menu:add_button("Instant Finish", "", function() script.locals("fm_mission_controller_2020", 56223+1).int32=51338752; script.locals("fm_mission_controller_2020", 56223+1776+1).int32=50 end)
    agency_menu:add_button("Remove Cooldown", "", function() account.stats("MP0_FIXER_STORY_COOLDOWN_POSIX").int32=0; account.stats("MP0_FIXER_SECURITY_CONTRACT_COOLDOWN_TIME").int32=0 end)

    local autoshop_menu = Menu.new("Auto Shop")
    local as_payout = 1000000
    autoshop_menu:add_button("Instant Finish", "", function() script.locals("fm_mission_controller_2020", 56223+1).int32=51338977; script.locals("fm_mission_controller_2020", 56223+1776+1).int32=101 end)
    autoshop_menu:add_select("Payout", "", list_autoshop_payout, find_index(list_autoshop_payout, 1000000), function(v) as_payout = v[2] end)
    autoshop_menu:add_button("Apply Payout", "Use after start", function() for i=0,7 do script.tunables("TUNER_ROBBERY_LEADER_CASH_REWARD"..i).int32=as_payout end; script.locals("tuner_planning", 408).int32=2 end)

    local salvage_menu = Menu.new("Salvage Yard")
    salvage_menu:add_button("Complete Preps", "", function() for _, s in ipairs({"SALV23_GEN_BS","SALV23_SCOPE_BS","SALV23_FM_PROG","SALV23_INST_PROG"}) do account.stats("MP0_"..s).int32=-1 end end)
    salvage_menu:add_button("Instant Finish (Cargo)", "", function() script.locals("fm_content_vehrob_cargo_ship",7187+1).int32=-2145370424; script.locals("fm_content_vehrob_cargo_ship",7308+1250).int32=1 end)
    salvage_menu:add_button("Instant Finish (Gangbanger)", "", function() script.locals("fm_content_vehrob_police",9013+1).int32=-2145370424; script.locals("fm_content_vehrob_police",9122+1306).int32=1 end)
    
    local cluckin_menu = Menu.new("Cluckin Bell")
    cluckin_menu:add_button("Skip to Finale", "", function() account.stats("MP0_SALV23_INST_PROG").int32=31 end)
    cluckin_menu:add_button("Instant Finish", "", function() 
        local b=56223; script.locals("fm_mission_controller_2020", 55173).int32=4000000; script.locals("fm_mission_controller_2020", b+1777).int32=999999; script.locals("fm_mission_controller_2020", b+1062).int32=5; script.locals("fm_mission_controller_2020", b+1).int32=script.locals("fm_mission_controller_2020", b+1).int32|(1<<9)|(1<<16)
    end)

    local vip_menu = Menu.new("VIP Work")
    vip_menu:add_button("Sightseer Finish", "", function() script.globals(1950714+12961).int32=0 end)
    vip_menu:add_button("Fortified Start", "", function() script.globals(1950714+19226).int32=20000 end)

    -- ADD TO ROOT
    root:add_submenu("Payout Limits", "Safe money limits", info_menu) -- ADDED AS REQUESTED AT START
    root:add_submenu("Cayo Perico", "The Island Heist", cayo_menu)
    root:add_submenu("Casino Heist", "Diamond Casino", casino_menu)
    root:add_submenu("Doomsday Heist", "Acts 1, 2, 3", dooms_menu)
    root:add_submenu("Classic Heists", "Apartment Jobs", classic_menu)
    root:add_submenu("Auto Shop", "Contracts", autoshop_menu)
    root:add_submenu("Agency", "Dre & Contracts", agency_menu)
    root:add_submenu("Salvage Yard", "Vehicle Robberies", salvage_menu)
    root:add_submenu("Cluckin Bell", "Farm Raid", cluckin_menu)
    root:add_submenu("VIP Work", "CEO", vip_menu)
    root:add_submenu("Settings", "Move Menu / Colors", settings_menu)
    
    root:add_button("Unlock GTA+", "Temp Loop", function()
        local s = memory.scan("48 8D 15 ? ? ? ? 41 B8 18 02 00 00 E8")
        if s.value ~= 0 then local a = s:rip(3,7); a.int32 = 1; script.globals(1965683).bool = true; script.globals(1965683):at(3).int32 = 10 end
    end)

    return root
end

-----
-- 4. INIT
-----
local function Init()
    LoadConfig()
    MenuSystem.root = CreateHeistMenu()
    MenuSystem.open()
    notify.push("Heist Control Ultimate", "Loaded. Press T to open.", 3000)
    util.create_thread(function()
        while true do Input.process(); Renderer.draw_menu(); util.yield(0) end
    end)
end

Init()