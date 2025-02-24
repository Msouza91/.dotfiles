local opt = vim.opt
local api = vim.api
local glb = vim.g

api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.j2",
	command = "setfiletype jinja",
})

api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.json",
	command = "set conceallevel=0",
})

opt.guicursor = ""
opt.nu = true
opt.relativenumber = true

-- No need to see the mode since I'm using statusline
opt.showmode = false

-- global status
opt.laststatus = 3

-- Set splits to my liking
opt.splitbelow = true
opt.splitright = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- Cursive italic comments haha
api.nvim_set_hl(0, "Comment", { italic = true })

opt.smartindent = true
opt.indentexpr = "nvim_treesitter#indent()"

opt.wrap = false

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

opt.conceallevel = 2

opt.cursorline = true

-- Extra transparency~
glb.transparent_groups = vim.list_extend(glb.transparent_groups or {}, {
	"FloatBorder",
	"NormalFloat",
})
