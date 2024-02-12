return {
	name = "pkl",
	event = { "BufReadPre", "BufNewFile" },
	"apple/pkl-neovim",
	config = function()
		local hasConfigs, configs = pcall(require, "nvim-treesitter.configs")
		if hasConfigs then
			configs.setup({
				ensure_installed = "pkl",
				highlight = {
					enable = true, -- false will disable the whole extension
				},
				indent = {
					enable = true,
				},
			})
		end
	end,
}
