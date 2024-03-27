local wezterm = require 'wezterm';
local config = wezterm.config_builder();

config.color_scheme = "Dracula";
config.colors = {
    background = "#191929",
}

-- config.enable_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.font_size = 15.0

config.window_background_opacity = 0.9

config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

return config
