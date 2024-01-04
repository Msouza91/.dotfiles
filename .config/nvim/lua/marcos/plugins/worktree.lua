return {
	"ThePrimeagen/git-worktree.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "nvim-telescope/telescope.nvim", opt = true },
		{ "nvim-lua/plenary.nvim", opt = true },
	},
	config = function()
		require("git-worktree").setup({
			update_on_change = true,
			clearjumps_on_change = true,
			autopush = false,
		})
	end,
}
