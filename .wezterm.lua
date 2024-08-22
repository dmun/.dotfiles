local wezterm = require("wezterm")
local act = wezterm.action

return {
	default_prog = { "C:\\WINDOWS\\system32\\wsl.exe", "-d", "Arch" },

	color_scheme = "Catppuccin Mocha",

	-- Font
	front_end = "WebGpu",
	font_size = 11,
	font = wezterm.font("JetBrains Mono"),
	freetype_load_target = "Normal",
	line_height = 1.1,

	-- Tab Bar
	enable_tab_bar = true,
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,

	-- Window
	window_decorations = "RESIZE",
	window_close_confirmation = "NeverPrompt",
	use_resize_increments = true,
	adjust_window_size_when_changing_font_size = false,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},

	-- Keys
	leader = { key = "s", mods = "CTRL", timeout_milliseconds = 1000 },
	keys = {
		{
			key = "c",
			mods = "LEADER",
			action = act.SpawnTab("CurrentPaneDomain"),
		},
		{
			key = "n",
			mods = "ALT",
			action = act.ActivateTabRelative(1),
		},
		{
			key = "p",
			mods = "ALT",
			action = act.ActivateTabRelative(-1),
		},
	},
}
