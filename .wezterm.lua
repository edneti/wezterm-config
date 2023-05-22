local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.color_scheme = "Catppuccin Mocha" -- or Macchiato, Frappe, Latte
config.font = wezterm.font 'JetBrains Mono'
config.window_frame = {
    font = wezterm.font {
        family = 'Roboto',
        weight = 'Bold'
    },
    font_size = 12.0,
    active_titlebar_bg = '#333333',
    inactive_titlebar_bg = '#333333'
}

local act = wezterm.action

config.keys = {{
    key = 't',
    mods = 'CTRL',
    action = act.SpawnTab 'CurrentPaneDomain'
}, {
    key = 't',
    mods = 'SHIFT|ALT',
    action = act.SpawnTab 'DefaultDomain'
}, {
    key = 't',
    mods = 'SHIFT|ALT',
    action = act.SpawnTab {
        DomainName = 'unix'
    }
}, {
    key = 'w',
    mods = 'CTRL',
    action = wezterm.action.CloseCurrentTab {
        confirm = true
    }
}}

for i = 1, 8 do
    table.insert(config.keys, {
        key = tostring(i),
        mods = 'CTRL',
        action = act.ActivateTab(i - 1)
    })
    table.insert(config.keys, {
        key = 'F' .. tostring(i),
        action = act.ActivateTab(i - 1)
    })
end

config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.default_prog = {"C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe"}

return config
