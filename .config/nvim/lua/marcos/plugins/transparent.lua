return {
	"xiyaowong/transparent.nvim",
	lazy = false,
	config = function()
		local opts = {
			groups = {
				"Normal",
				"NormalFloat",
				"NormalNC",
				"Comment",
				"Constant",
				"Special",
				"Identifier",
				"Statement",
				"PreProc",
				"Type",
				"Underlined",
				"Todo",
				"String",
				"Function",
				"Conditional",
				"Repeat",
				"Operator",
				"Structure",
				"LineNr",
				"NonText",
				"SignColumn",
				"CursorLine",
				"CursorLineNr",
				"StatusLine",
				"StatusLineNC",
				"EndOfBuffer",
			},
			-- table: additional groups that should be cleared
			extra_groups = {},
			-- table: groups you don't want to clear
			exclude_groups = {},
			-- function: code to be executed after highlight groups are cleared
			-- Also the user event "TransparentClear" will be triggered
			on_clear = function() end,
		}
		require("transparent").setup(opts)
		require("transparent").clear_prefix("telescope")
		require("transparent").clear_prefix("notify")
		require("transparent").clear_prefix("NvimTree")
		require("transparent").clear_prefix("Fugitive")
	end,
}
