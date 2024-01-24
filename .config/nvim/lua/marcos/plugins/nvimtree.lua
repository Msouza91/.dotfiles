return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"kyazdani42/nvim-web-devicons",
	},
	config = function()
		local opts = {
			disable_netrw = true,
			hijack_netrw = true,
			open_on_tab = false,
			hijack_cursor = false,
			update_cwd = false,
			update_focused_file = {
				enable = true,
				update_cwd = false,
				ignore_list = {},
			},
			system_open = {
				cmd = nil,
				args = {},
			},
			view = {
				width = 25,
				side = "left",
			},
		}
		require("nvim-tree").setup(opts)
	end,
}
