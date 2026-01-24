local wezterm = require("wezterm")
local act = wezterm.action

-- ==============================
-- Base Config
-- ==============================
local config = {}

-- ==============================
-- Window decorations (BASE)
-- ==============================
-- IMPORTANT:
-- In Wayland, if not defined, the default is "RESIZE"
-- That's why we force it to NONE here
config.window_decorations = "NONE"

-- ==============================
-- Wayland
-- ==============================
config.enable_wayland = false

-- ==============================
-- Colors
-- ==============================
config.colors = {
	foreground = "#C9C7CD",
	background = "#090f16",

	cursor_bg = "#92A2D5",
	cursor_fg = "#C9C7CD",
	cursor_border = "#92A2D5",

	selection_fg = "#C9C7CD",
	selection_bg = "#3B4252",

	scrollbar_thumb = "#4C566A",
	split = "#4C566A",

	ansi = {
		"#000000",
		"#EA83A5",
		"#90B99F",
		"#E6B99D",
		"#85B5BA",
		"#92A2D5",
		"#85B5BA",
		"#C9C7CD",
	},

	brights = {
		"#4C566A",
		"#EA83A5",
		"#90B99F",
		"#E6B99D",
		"#85B5BA",
		"#92A2D5",
		"#85B5BA",
		"#C9C7CD",
	},

	indexed = {
		[16] = "#F5A191",
		[17] = "#E29ECA",
	},
}

-- ==============================
-- Padding
-- ==============================
config.window_padding = {
	left = 20,
	right = 20,
	top = 20,
	bottom = 10,
}

-- ==============================
-- Font
-- ==============================
config.font = wezterm.font_with_fallback({
	"FiraCode Nerd Font Mono",
	"Symbols Nerd Font Mono",
	"Noto Color Emoji",
})
config.font_size = 12.0

-- ==============================
-- UI
-- ==============================
config.enable_tab_bar = true
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.90
config.adjust_window_size_when_changing_font_size = false
config.max_fps = 240
config.enable_kitty_graphics = true
config.enable_scroll_bar = false

wezterm.on("update-right-status", function(window, pane)
	local date = wezterm.strftime("%H:%M:%S    ")

	-- Make it italic and underlined
	window:set_right_status(wezterm.format({
		{ Attribute = { Italic = true } },
		{ Text = "" .. date },
	}))
end)

-- ==============================
-- Keys
-- ==============================
config.keys = {
	{ key = "h", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Left", 1 }) },
	{ key = "l", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Right", 1 }) },
	{ key = "k", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Up", 1 }) },
	{ key = "j", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Down", 1 }) },
	-- { key = "Enter", mods = "ALT", action = act.DisableDefaultAssignment },
}
-- ==============================
-- Return config
-- ==============================
return config
