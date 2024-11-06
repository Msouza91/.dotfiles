local wezterm = require("wezterm")
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "rose-pine"
	else
		return "rose-pine-dawn"
	end
end

config.font_size = 21

--config.font = wezterm.font({ family = "Maple Mono NF" })
config.font = wezterm.font({ family = "IosevkaTerm Nerd Font" })
--config.font = wezterm.font({ family = "CaskaydiaCove Nerd Font" })
--config.font = wezterm.font({ family = "BerkeleyMonoTrial Nerd Font" })
--config.font = wezterm.font({ family = "CartographCF Nerd Font Mono" })
--config.font = wezterm.font({ family = "VictorMono Nerd Font" })

config.font_rules = {
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font({
			--family = "Maple Mono NF",
			family = "Maple Mono NF",
			weight = "Bold",
			--style = "Italic",
		}),
	},
	{
		italic = true,
		intensity = "Half",
		font = wezterm.font({
			--family = "Maple Mono NF",
			family = "Maple Mono NF",
			weight = "DemiBold",
			style = "Italic",
		}),
	},
	{
		italic = true,
		intensity = "Normal",
		font = wezterm.font({
			--family = "Maple Mono NF",
			family = "Maple Mono NF",
			style = "Italic",
		}),
	},
}

config.enable_tab_bar = false

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.85
config.macos_window_background_blur = 10

config.send_composed_key_when_left_alt_is_pressed = true
config.keys = {
	{ key = "8", mods = "OPT", action = act({ SendString = "[" }) },
	{ key = "9", mods = "OPT", action = act({ SendString = "]" }) },
}

wezterm.on("window-config-reloaded", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	local appearance = window:get_appearance()
	local scheme = scheme_for_appearance(appearance)
	if overrides.color_scheme ~= scheme then
		overrides.color_scheme = scheme
		window:set_config_overrides(overrides)
	end
end)

return config
