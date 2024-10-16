return {
	"cormacrelf/dark-notify",
	lazy = false,
	priority = 1000,

	config = function()
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		local dn = require("dark_notify")
		local opts = {
			schemes = {
				-- you can use a different colorscheme for each
				dark = "rose-pine",
				-- even a different `set background=light/dark` setting or lightline theme
				-- if you use lightline, you may want to configure lightline themes,
				-- even if they're the same one, especially if the theme reacts to :set bg
				light = {
					colorscheme = "rose-pine-dawn",
				},
			},
		}
		dn.run(opts)
	end,
}
