-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap.set

-- Exit normal mode with jk
keymap("i", "jk", "<ESC>")

-- Chg to current file directory
keymap("n", "<leader>cd", "<CMD>lcd %:p:h<CR>")

-- Move selected line / block of text in visual mode
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

-- Execute macro over a visual region.
keymap("x", "@", function()
  return ":norm @" .. vim.fn.getcharstr() .. "<cr>"
end, { expr = true })

-- greatest remap ever
keymap("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
keymap({ "n", "v" }, "<leader>y", [["+y]])
keymap("n", "<leader>Y", [["+Y]])

-- Terminal Escape
local opts = {}
keymap("t", "jj", [[<C-\><C-n>]], opts)

-- Indent while remaining in visual mode.
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- delete to black hole register
keymap({ "n", "v" }, "<leader>d", [["_d]])

-- replace word under cursor
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- grant execute permission
keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
