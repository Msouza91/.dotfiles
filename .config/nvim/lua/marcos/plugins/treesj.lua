return {
	"Wansmer/treesj",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("treesj").setup({ use_default_keymaps = false })
	end,
}
