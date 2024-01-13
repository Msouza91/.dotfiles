return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		local opts = {
			theme = "hyper", --  theme is doom and hyper default is hyper
			shortcut_type = "letter", --  shorcut type 'letter' or 'number'
			change_to_vcs_root = "true", -- default is false,for open file in hyper mru. it will change to the root of vcs
			config = { --  config used for theme
				week_header = {
					enable = true,
				},
				shortcut = {
					{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
					{
						icon = " ",
						icon_hl = "@variable",
						desc = "Files",
						group = "Label",
						action = "Telescope find_files",
						key = "f",
					},
					{
						desc = "󱚠 ChatGPT",
						group = "DiagnosticHint",
						action = "Telescope gpt",
						key = "a",
					},
					{
						desc = "󰎚 Daily Note",
						group = "Number",
						action = "ObsidianToday",
						key = "d",
					},
				},
			},
		}
		require("dashboard").setup(opts)
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
