vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.indentexpr = "nvim_treesitter#indent()"

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.conceallevel = 1

vim.opt.cursorline = true

-- Neovide shizz
-- Put anything you want to happen only in Neovide here
-- Helper function for transparency formatting
local alpha = function()
	return string.format("%x", math.floor(255 * (vim.g.transparency or 0.9)))
end
-- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
vim.g.neovide_transparency = 0.9
vim.g.transparency = 0
vim.g.neovide_background_color = "#0f1117" .. alpha()
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0
vim.g.neovide_fullscreen = true

-- Extra transparency~
vim.g.transparent_groups = vim.list_extend(vim.g.transparent_groups or {}, {
	"FloatBorder",
	"NormalFloat",
})
