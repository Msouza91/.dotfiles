return {
	"echasnovski/mini.animate",
	version = "*",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("mini.animate").setup()
	end,
}
