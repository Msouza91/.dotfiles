return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local nvimbattery = {
			function()
				return require("battery").get_status_line()
			end,
		}
		local at_statusline = {
			require("noice").api.statusline.mode.get,
			cond = require("noice").api.statusline.mode.has,
			color = { fg = "#ff9e64" },
		}
		local p = require("rose-pine.palette")

		return {
			normal = {
				a = { bg = p.rose, fg = p.base, gui = "bold" },
				b = { bg = p.overlay, fg = p.rose },
				c = { bg = p.base, fg = p.text },
			},
			insert = {
				a = { bg = p.foam, fg = p.base, gui = "bold" },
				b = { bg = p.overlay, fg = p.foam },
				c = { bg = p.base, fg = p.text },
			},
			visual = {
				a = { bg = p.iris, fg = p.base, gui = "bold" },
				b = { bg = p.overlay, fg = p.iris },
				c = { bg = p.base, fg = p.text },
			},
			replace = {
				a = { bg = p.pine, fg = p.base, gui = "bold" },
				b = { bg = p.overlay, fg = p.pine },
				c = { bg = p.base, fg = p.text },
			},
			command = {
				a = { bg = p.love, fg = p.base, gui = "bold" },
				b = { bg = p.overlay, fg = p.love },
				c = { bg = p.base, fg = p.text },
			},
			inactive = {
				a = { bg = p.base, fg = p.muted, gui = "bold" },
				b = { bg = p.base, fg = p.muted },
				c = { bg = p.base, fg = p.muted },
			},
		},
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "p",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = {
						statusline = {},
						winbar = {},
					},
					ignore_focus = {},
					always_divide_middle = true,
					globalstatus = false,
					refresh = {
						statusline = 1000,
						tabline = 1000,
						winbar = 1000,
					},
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics", at_statusline },
					lualine_c = { "filename" },
					lualine_x = { "encoding", "fileformat", "filetype", nvimbattery },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {},
				winbar = {},
				inactive_winbar = {},
				extensions = {},
			})
	end,
}
