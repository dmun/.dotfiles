local wezterm = require("wezterm")
local act = wezterm.action

return {
	default_domain = "WSL:Arch",

	-- Appearance
	color_scheme = "Catppuccin Mocha",
	front_end = "WebGpu",
	webgpu_power_preference = "HighPerformance",

	-- Font
	font_size = 12,
	font = wezterm.font("JetBrains Mono"),
	line_height = 1.2,
	underline_thickness = 2,

	-- Tab Bar
	enable_tab_bar = true,
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = false,

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
			key = "w",
			mods = "ALT",
			action = act.CloseCurrentTab({ confirm = false }),
		},
		{
			key = "t",
			mods = "ALT",
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
