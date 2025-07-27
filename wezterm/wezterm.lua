local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.adjust_window_size_when_changing_font_size = false
config.animation_fps = 120
config.check_for_updates = false

config.color_scheme = "catppuccin-mocha"

config.colors = {
	background = "#000000",
	cursor_bg = "#f8f8f2",
	cursor_fg = "#282a36",
}

config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.cursor_blink_rate = 400
config.default_cursor_style = "BlinkingBlock"

config.hide_tab_bar_if_only_one_tab = true
config.font = wezterm.font("IosevkaTermNerdFontMono")
config.font_size = 13.2

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
