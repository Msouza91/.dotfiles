return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local opts = {
			options = {
				separator_style = "slope",
				always_show_bufferline = false,
				show_duplicate_prefix = true,
				show_close_icon = true,
				show_tab_indicators = true,
				hover = {
					enable = true,
					delay = 200,
					reveal = { "close" },
				},
			},
		}
		require("bufferline").setup(opts)
	end,
}
