------------------MAPPTINGS------------------

local utils = require("marcos.utils")

-- Set leader

vim.g.mapleader = " "

-- Terminal
vim.keymap.set("n", "<leader>tt", "<CMD> belowright 15sp term://$SHELL<CR>i")

-- Netrw
vim.keymap.set("n", "<leader>pv", "<CMD>NvimTreeToggle<CR>")

-- Chg to current file directory
vim.keymap.set("n", "<leader>cd", "<CMD>lcd %:p:h<CR>")

-- Move selected line / block of text in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Better navigation
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- TreeSJ
vim.keymap.set("n", "<leader>m", "<CMD>TSJToggle<CR>")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Terminal Escape
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Escape from term-mode" })

-- run current file
vim.keymap.set("n", "<leader>r", utils.save_and_exec, { desc = "Save and execute file" })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- delete to black hole register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- replace word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- grant execute permission
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/.config/nvim/lua/marcos/plugins<CR>")

-- source file
vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)

-- tmux sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Lazy window
vim.keymap.set("n", "<leader>l", function()
	vim.cmd("Lazy")
end)

-- Lsp Formatting
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Quickfix navigation
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lprev<CR>zz")

-- Terraform shortcuts
vim.keymap.set("n", "<leader>ti", ":!terraform init<CR>")
vim.keymap.set("n", "<leader>tv", ":!terraform validate<CR>")
vim.keymap.set("n", "<leader>tp", ":!terraform plan<CR>")

-- Terraform docs
vim.keymap.set("n", "<leader>td", "<cmd>Telescope terraform_doc<cr>")
vim.keymap.set("n", "<leader>tdm", "<cmd>Telescope terraform_doc modules<cr>")

-- Worktree shortcuts
vim.keymap.set("n", "<leader>ws", ":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>")
vim.keymap.set("n", "<leader>wc", ":lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>")

-- Telescope ChatGPT
vim.keymap.set("n", "<leader>c", "<cmd>Telescope gpt<CR>")

-- Obsidian
vim.keymap.set("n", "<leader>o", function()
	vim.cmd("ObsidianSearch")
end)
vim.keymap.set("n", "<leader>od", function()
	vim.cmd("ObsidianToday")
end)
vim.keymap.set("n", "<leader>oy", function()
	vim.cmd("ObsidianYesterday")
end)
vim.keymap.set("n", "<leader>ot", function()
	vim.cmd("ObsidianTomorrow")
end)
vim.keymap.set("n", "<leader>op", function()
	vim.cmd("ObsidianPasteImg")
end)

-- MD Preview
vim.keymap.set("n", "<leader>md", function()
	vim.cmd("MarkdownPreviewToggle")
end)
