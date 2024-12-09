return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local highlight = {
			"RainbowRed",
			"RainbowYellow",
			"RainbowBlue",
			"RainbowOrange",
			"RainbowGreen",
			"RainbowViolet",
			"RainbowCyan",
		}

		local hooks = require("ibl.hooks")
		-- create the highlight groups in the highlight setup hook, so they are reset
		-- every time the colorscheme changes
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#e67e80" })
			vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#dbbc7f" })
			vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#7fbbb3" })
			vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#e69875" })
			vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#a7c080" })
			vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#d699b6" })
			vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#83c092" })
		end)

		require("ibl").setup({ indent = { highlight = highlight } })
	end,
}
