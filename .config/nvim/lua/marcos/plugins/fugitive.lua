return {
	"tpope/vim-fugitive",
	event = "VimEnter",
	config = function()
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

		local Marcos_Fugitive = vim.api.nvim_create_augroup("Marcos_Fugitive", {})

		local autocmd = vim.api.nvim_create_autocmd
		autocmd("BufWinEnter", {
			group = Marcos_Fugitive,
			pattern = "*",
			callback = function()
				if vim.bo.ft ~= "fugitive" then
					return
				end

				local bufnr = vim.api.nvim_get_current_buf()
				local opts = { buffer = bufnr, remap = false }
				vim.keymap.set("n", "<leader>p", function()
					vim.cmd.Git("push")
				end, opts)

				-- rebase always
				vim.keymap.set("n", "<leader>P", function()
					vim.cmd.Git({ "pull", "--rebase" })
				end, opts)

				-- NOTE: It allows me to easily set the branch i am pushing and any tracking
				-- needed if i did not set the branch up correctly
				vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts)
			end,
		})
		-- Add diff mappings for merge conflict resolution
		vim.keymap.set("n", "<leader>cl", ":diffget //2<CR>", { desc = "Get diff from LEFT (target branch)" })
		vim.keymap.set("n", "<leader>cr", ":diffget //3<CR>", { desc = "Get diff from RIGHT (merge branch)" })
		vim.keymap.set("n", "<leader>cb", ":diffget //1<CR>", { desc = "Get diff from BASE" })

		-- Additional helpful diff commands
		vim.keymap.set("n", "<leader>gd", ":Gvdiffsplit!<CR>", { desc = "Open diff view" })
		vim.keymap.set("n", "<leader>gD", ":Git diff<CR>", { desc = "Show changes" })
	end,
}
