local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "catppuccin-mocha"

config.colors = {
    cursor_bg = "#f8f8f2",
    cursor_fg = "#282a36",
}

-- config.enable_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.font = wezterm.font("IosevkaTerm Nerd Font", { weight = "Medium" })
config.use_fancy_tab_bar = false
config.font_size = 14

-- config.window_background_opacity = 0.90

config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

config.inactive_pane_hsb = {
    saturation = 0.4,
    brightness = 0.6,
}

config.keys = {
    {
        key = "|",
        mods = "CTRL|SHIFT",
        action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
    },
    {
        key = "|",
        mods = "CTRL|SHIFT|ALT",
        action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
    },
    {
        key = "h",
        mods = "CTRL|SHIFT",
        action = wezterm.action.ActivatePaneDirection("Left"),
    },
    {
        key = "l",
        mods = "CTRL|SHIFT",
        action = wezterm.action.ActivatePaneDirection("Right"),
    },
    {
        key = "k",
        mods = "CTRL|SHIFT",
        action = wezterm.action.ActivatePaneDirection("Up"),
    },
    {
        key = "j",
        mods = "CTRL|SHIFT",
        action = wezterm.action.ActivatePaneDirection("Down"),
    },
}

return config
