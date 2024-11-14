return {
	"neanias/everforest",
	name = "everforest",
	lazy = false,
	config = function()
		vim.cmd("colorscheme everforest")
		--vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.g.everforest_background = "hard"
	end,
}
