return {
	"xiyaowong/transparent.nvim",
	config = function()
		require("transparent").clear_prefix("Bufferline")
		require("transparent").clear_prefix("Telescope")
		require("transparent").clear_prefix("Notify")
	end,
}
