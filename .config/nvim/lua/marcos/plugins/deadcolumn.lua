return {
	"Bekaboo/deadcolumn.nvim",
	event = { "BufRead", "BufNewFile" },
	config = function()
		require("deadcolumn").setup({
			warning = {
				alpha = 0.4,
				offset = 0,
				color = "#eb6f92",
				hlgroup = {
					"Error",
					"background",
				},
			},
		})
	end,
}
