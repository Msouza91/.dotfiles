vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true

-- No need to see the mode since I'm using statusline
vim.opt.showmode = false

-- Set splits to my liking
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Cursive italic comments haha
vim.api.nvim_set_hl(0, "Comment", { italic = true })

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

vim.opt.conceallevel = 2

vim.opt.cursorline = true

-- Extra transparency~
vim.g.transparent_groups = vim.list_extend(vim.g.transparent_groups or {}, {
	"FloatBorder",
	"NormalFloat",
})
