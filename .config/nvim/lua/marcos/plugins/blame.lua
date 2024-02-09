return {
	"f-person/git-blame.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		vim.g.gitblame_enabled = 1
		vim.g.gitblame_message_template = "<summary> • <date> • <author>"
		vim.g.gitblame_date_format = "%c"
	end,
}
