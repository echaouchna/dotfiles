local wezterm = require("wezterm")

return {
	font = wezterm.font({
		-- family = "MesloLGS NF",
		family = "Monolisa",
		weight = "Medium",
	}),
	font_size = 14.0,
	-- color_scheme = "rose-pine",
	-- color_scheme = "rose-pine-moon",
	color_scheme = "tokyonight",
	-- color_scheme = "Catppuccin Macchiato (Gogh)",
	macos_window_background_blur = 30,
	keys = {
		-- delete the whole line with cmd + backspace
		{
			key = "Backspace",
			mods = "CMD",
			action = wezterm.action.SendString("\x15"),
		},
		-- move to the beginning of the line with cmd + left
		{
			key = "LeftArrow",
			mods = "CMD",
			action = wezterm.action.SendString("\x01"),
		},
		-- move to the end of the line with cmd + right
		{
			key = "RightArrow",
			mods = "CMD",
			action = wezterm.action.SendString("\x05"),
		},
		-- open a new pane with cmd + shift + t
		{
			key = "d",
			mods = "CMD",
			action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
		},
		-- open vertical split with cmd + shift + d
		{
			key = "d",
			mods = "CMD|SHIFT",
			action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
		},
		-- move to right pane with cmd + shift + right
		{
			key = "RightArrow",
			mods = "CMD|SHIFT",
			action = wezterm.action({ ActivatePaneDirection = "Right" }),
		},
		-- move to left pane with cmd + shift + left
		{
			key = "LeftArrow",
			mods = "CMD|SHIFT",
			action = wezterm.action({ ActivatePaneDirection = "Left" }),
		},
		-- move to down pane with cmd + shift + down
		{
			key = "DownArrow",
			mods = "CMD|SHIFT",
			action = wezterm.action({ ActivatePaneDirection = "Down" }),
		},
		-- move to up pane with cmd + shift + up
		{
			key = "UpArrow",
			mods = "CMD|SHIFT",
			action = wezterm.action({ ActivatePaneDirection = "Up" }),
		},
		-- move to next tab with cmd + shift + [
		{
			key = "]",
			mods = "CMD|SHIFT",
			action = wezterm.action({ ActivateTabRelative = 1 }),
		},
		-- move to previous tab with cmd + shift + up
		{
			key = "[",
			mods = "CMD|SHIFT",
			action = wezterm.action({ ActivateTabRelative = -1 }),
		},
		-- Toggle zoom with cmd + shift + enter
		{
			key = "Return",
			mods = "CMD|SHIFT",
			action = wezterm.action.TogglePaneZoomState,
		},
		-- TODO: change pane layout with cmd + shift + l
		-- {
		-- 	key = "l",
		-- 	mods = "CMD|SHIFT",
		-- 	action = wezterm.action({ ActivatePaneLayout = "MainVertical" }),
		-- },
		-- TODO: rename tab with cmd + shift + r
		-- {
		-- 	key = "r",
		-- 	mods = "CMD|SHIFT",
		-- 	action = wezterm.action({ ShowTabNavigator = true }),
		-- },
		-- activate palette with cmd + shift + p
		{
			key = "p",
			mods = "CMD|SHIFT",
			action = wezterm.action.ActivateCommandPalette,
		},
	},
	-- mouse_bindings = {
	-- 	-- Ctrl-click will open the link under the mouse cursor
	-- 	{
	-- 		event = { Up = { streak = 1, button = "Left" } },
	-- 		mods = "CTRL",
	-- 		action = wezterm.action.OpenLinkAtMouseCursor,
	-- 	},
	-- },
}
