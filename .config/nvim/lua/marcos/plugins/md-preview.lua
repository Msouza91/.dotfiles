return {
	"iamcco/markdown-preview.nvim",
	build = "pnpm up && cd app && pnpm install",
	event = "VeryLazy",
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	ft = { "markdown" },
}
