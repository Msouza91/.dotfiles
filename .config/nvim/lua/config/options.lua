-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt
local api = vim.api
local glb = vim.g

-- Set some lazyvim deafult options

glb.snacks_animate = false
glb.autoformat = false

opt.clipboard = ""

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
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

if vim.g.neovide then
  vim.g.neovide_window_blurred = true
  vim.g.neovide_opacity = 0.8
  vim.g.transparency = 0.8
end
