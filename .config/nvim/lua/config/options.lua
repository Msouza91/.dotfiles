-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt
local api = vim.api
local glb = vim.g

-- Set some lazyvim deafult options

glb.snacks_animate = false
glb.autoformat = false

-- Other options

opt.clipboard = ""

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- Cursive italic comments haha
api.nvim_set_hl(0, "Comment", { italic = true })

opt.smartindent = true
opt.indentexpr = "nvim_treesitter#indent()"

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.incsearch = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50
opt.colorcolumn = "80"

-- Commented ou for now, using neovide the clipboard detection works fine
-- glb.clipboard = {
--   name = "win32yank-wsl",
--   copy = {
--     ["+"] = "win32yank.exe -i --crlf",
--     ["*"] = "win32yank.exe -i --crlf",
--   },
--   paste = {
--     ["+"] = "win32yank.exe -o --crlf",
--     ["*"] = "win32yank.exe -o --crlf",
--   },
--   cache_enable = 0,
-- }
