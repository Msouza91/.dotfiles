return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	version = "0.1.6", -- or, branch = '0.1.x',
	dependencies = {
		"nvim-lua/plenary.nvim",
		--Extensions
		"ANGkeith/telescope-terraform-doc.nvim",
		"xiyaowong/telescope-emoji.nvim",
		-- GPT Extension depends on chatgpt
		"HPRIOR/telescope-gpt",
		"nvim-telescope/telescope.nvim",
		-- End of GPT Extension
		--{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
		vim.keymap.set("n", "<C-p>", builtin.git_files, {})
		vim.keymap.set("n", "<leader>e", "<cmd>Telescope emoji<CR>", {})
		vim.keymap.set("n", "<leader>ps", function()
			vim.ui.input({ prompt = "Grep > ", cancel_on_esc = true }, function(input)
				builtin.grep_string({ search = input })
			end)
		end)
		vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
		local opts = {
			defaults = {
				prompt_prefix = "🔍",
			},
			extensions = {
				"fzf",
				"telescope-terraform-doc",
				"git_worktree",
				"createP_git_worktree",
				"emoji",
				gpt = {
					title = "Gpt Actions",
					commands = {
						"add_tests",
						"chat",
						"docstring",
						"explain_code",
						"fix_bugs",
						"grammar_correction",
						"interactive",
						"optimize_code",
						"summarize",
						"translate",
					},
				},
			},
		}
		require("telescope").setup(opts)
	end,
}
