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
--config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_decorations = "NONE"

-- ==============================
-- Wayland
-- ==============================
config.enable_wayland = true
config.front_end = "WebGpu"

-- ==============================
-- Colors
-- ==============================
config.colors = {
	foreground = "#C9C7CD",
	background = "#1e1e2e",

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
	"JetbrainsMono Nerd Font",
})
config.font_size = 9.0

-- ==============================
-- UI
-- ==============================
config.enable_tab_bar = true
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 1.0
config.adjust_window_size_when_changing_font_size = false
config.animation_fps = 30
config.max_fps = 60
config.scrollback_lines = 5000
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
	{ key = "t", mods = "SUPER", action = wezterm.action.DisableDefaultAssignment },
	-- { key = "Enter", mods = "ALT", action = act.DisableDefaultAssignment },
	-- { key = "o", mods = "CTRL|SHIFT", action = wezterm.action.ShowDebugOverlay },

	-- Disable default Ctrl+Shift+Arrow pane navigation
	{ key = "LeftArrow", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
	{ key = "RightArrow", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
	{ key = "UpArrow", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
	{ key = "DownArrow", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },

	-- Use Vim-style pane navigation
	{ key = "h", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "j", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Down") },
	{ key = "k", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "l", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Right") },

	-- Disable default Ctrl+Shift+Alt+Arrow pane resizing
	{ key = "LeftArrow", mods = "CTRL|SHIFT|ALT", action = wezterm.action.DisableDefaultAssignment },
	{ key = "RightArrow", mods = "CTRL|SHIFT|ALT", action = wezterm.action.DisableDefaultAssignment },
	{ key = "UpArrow", mods = "CTRL|SHIFT|ALT", action = wezterm.action.DisableDefaultAssignment },
	{ key = "DownArrow", mods = "CTRL|SHIFT|ALT", action = wezterm.action.DisableDefaultAssignment },

	-- Use Vim-style pane resizing
	{ key = "h", mods = "CTRL|SHIFT|ALT", action = wezterm.action.AdjustPaneSize({ "Left", 2 }) },
	{ key = "j", mods = "CTRL|SHIFT|ALT", action = wezterm.action.AdjustPaneSize({ "Down", 2 }) },
	{ key = "k", mods = "CTRL|SHIFT|ALT", action = wezterm.action.AdjustPaneSize({ "Up", 2 }) },
	{ key = "l", mods = "CTRL|SHIFT|ALT", action = wezterm.action.AdjustPaneSize({ "Right", 2 }) },

	-- Toggle for transparent background
	{
		key = "u",
		mods = "CTRL|SHIFT",
		action = wezterm.action_callback(function(window, _)
			local overrides = window:get_config_overrides() or {}
			if overrides.window_background_opacity == 1.0 then
				overrides.window_background_opacity = 0.85
			else
				overrides.window_background_opacity = 1.0
			end
			window:set_config_overrides(overrides)
		end),
	},
}
-- ==============================
-- Return config
-- ==============================
return config
