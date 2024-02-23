return {
	"utilyre/barbecue.nvim",
	event = { "BufWinEnter", "BufNewFile" },
	name = "barbecue",
	version = "*",
	-- test
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons", -- optional dependency
	},
	config = function()
		vim.opt.updatetime = 200
		require("barbecue").setup({
			attach_navic = false, -- prevent barbecue from automatically attaching nvim-navic
			theme = {
				normal = { fg = "#faf4f4" }, -- Text

				ellipsis = { fg = "#7874b2" }, -- Muted
				separator = { fg = "#7874b2" }, -- Muted
				modified = { fg = "#7874b2" }, -- Muted

				dirname = { fg = "#d6c1f3" }, -- Subtle
				basename = { bold = true },
				context = {},

				context_file = { fg = "#9ccfd8" }, -- Foam
				context_module = { fg = "#9ccfd8" }, -- Foam
				context_namespace = { fg = "#9ccfd8" }, -- Foam
				context_package = { fg = "#9ccfd8" }, -- Foam
				context_class = { fg = "#9ccfd8" }, -- Foam
				context_method = { fg = "#9ccfd8" }, -- Foam
				context_property = { fg = "#9ccfd8" }, -- Foam
				context_field = { fg = "#9ccfd8" }, -- Foam
				context_constructor = { fg = "#9ccfd8" }, -- Foam
				context_enum = { fg = "#9ccfd8" }, -- Foam
				context_interface = { fg = "#9ccfd8" }, -- Foam
				context_function = { fg = "#9ccfd8" }, -- Foam
				context_variable = { fg = "#9ccfd8" }, -- Foam
				context_constant = { fg = "#9ccfd8" }, -- Foam
				context_string = { fg = "#9ccfd8" }, -- Foam
				context_number = { fg = "#9ccfd8" }, -- Foam
				context_boolean = { fg = "#9ccfd8" }, -- Foam
				context_array = { fg = "#9ccfd8" }, -- Foam
				context_object = { fg = "#9ccfd8" }, -- Foam
				context_key = { fg = "#9ccfd8" }, -- Foam
				context_null = { fg = "#9ccfd8" }, -- Foam
				context_enum_member = { fg = "#9ccfd8" }, -- Foam
				context_struct = { fg = "#9ccfd8" }, -- Foam
				context_event = { fg = "#9ccfd8" }, -- Foam
				context_operator = { fg = "#9ccfd8" }, -- Foam
				context_type_parameter = { fg = "#9ccfd8" }, -- Foam
			},
			create_autocmd = false, -- prevent barbecue from updating itself automatically
		})

		vim.api.nvim_create_autocmd({
			"WinScrolled", -- or WinResized on NVIM-v0.9 and higher
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
