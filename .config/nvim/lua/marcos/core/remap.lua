------------------MAPPTINGS------------------

local utils = require("marcos.utils")

local keymap = vim.keymap.set

-- Set leader

vim.g.mapleader = " "

-- Chg to current file directory
keymap("n", "<leader>cd", "<CMD>lcd %:p:h<CR>")

-- Move selected line / block of text in visual mode
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

-- Better navigation
keymap("n", "J", "mzJ`z")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- greatest remap ever
keymap("x", "<leader>p", [["_dP]])

-- Terminal Escape
local opts = {}
keymap("t", "jk", [[<C-\><C-n>]], opts)

-- Indent while remaining in visual mode.
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- run current file
keymap("n", "<leader>r", utils.save_and_exec, { desc = "Save and execute file" })

-- next greatest remap ever : asbjornHaland
keymap({ "n", "v" }, "<leader>y", [["+y]])
keymap("n", "<leader>Y", [["+Y]])

-- delete to black hole register
keymap({ "n", "v" }, "<leader>d", [["_d]])

-- replace word under cursor
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- grant execute permission
keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

keymap("n", "<leader>vpp", "<cmd>e ~/.dotfiles/.config/nvim/lua/marcos/plugins<CR>")

-- source file
keymap("n", "<leader><leader>", function()
	vim.cmd("so")
end)

-- tmux sessionizer
keymap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Lazy window
keymap("n", "<leader>l", function()
	vim.cmd("Lazy")
end)

-- Lsp Formatting
keymap("n", "<leader>f", vim.lsp.buf.format)

-- Quickfix navigation
keymap("n", "<C-j>", "<cmd>cnext<CR>zz")
keymap("n", "<C-k>", "<cmd>cprev<CR>zz")
keymap("n", "<leader>j", "<cmd>lnext<CR>zz")
keymap("n", "<leader>k", "<cmd>lprev<CR>zz")

-- MD Preview
keymap("n", "<leader>md", function()
	vim.cmd("MarkdownPreviewToggle")
end)
