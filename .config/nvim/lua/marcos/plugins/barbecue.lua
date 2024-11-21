return {
	"utilyre/barbecue.nvim",
	event = { "BufWinEnter", "BufNewFile" },
	name = "barbecue",
	version = "*",
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons", -- optional dependency
	},
	config = function()
		vim.opt.updatetime = 200
		require("barbecue").setup({
			attach_navic = false, -- prevent barbecue from automatically attaching nvim-navic
			theme = {
				context = {},
			},
			create_autocmd = false, -- prevent barbecue from updating itself automatically
		})

		vim.api.nvim_create_autocmd({
			"WinResized", -- WinResized on NVIM-v0.9 and higher, or WinScrolled in lower versions
			"BufWinEnter",
			"CursorHold",
			"InsertLeave",

			-- include this if you have set `show_modified` to `true`
			"BufModifiedSet",
		}, {
			group = vim.api.nvim_create_augroup("barbecue.updater", {}),
			callback = function()
				require("barbecue.ui").update()
			end,
		})
	end,
}
