"Clone vim-plug from github if it doesn't exist
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin()

"Plugins

"LSP Config
Plug 'neovim/nvim-lspconfig'
"Copilot
Plug 'github/copilot.vim'
"Nvim web devicons
Plug 'nvim-tree/nvim-web-devicons'
"Fzf Lua
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
"Vim Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Vim Fugitive
Plug 'tpope/vim-fugitive'
"Nerd Tree
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
"Nerd Commenter
Plug 'preservim/nerdcommenter'
"Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Auto Light/Dark theme
Plug 'f-person/auto-dark-mode.nvim'
"SecuriTree
Plug 'GeekMasher/securitree.nvim'
"Tokyonight
Plug 'folke/tokyonight.nvim'
"Nord
Plug 'shaunsingh/nord.nvim'

call plug#end()	

filetype plugin on

"Airline configuration
let g:airline_theme='nord_minimal'
let g:airline_powerline_fonts = 1

"Fzf Lua configuration
nnoremap <C-p> <cmd>lua require('fzf-lua').files()<CR>
nnoremap <C-b> <cmd>lua require('fzf-lua').buffers()<CR>
nnoremap <C-g> <cmd>lua require('fzf-lua').grep_visual()<CR>

"Vim Fugitive configuration
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gl :Git pull<CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gd :Gvdiffsplit<CR>

"Nerd Tree configuration
nnoremap <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

"Treesitter configuration
lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = { "c", "lua", "vim", "vimdoc", "json", "yaml", "python", "bash" },
  auto_install = true,
  highlight = {
    enable = true,              -- false will disable the whole extension
    -- disable = { "c", "rust" },  -- list of language that will be disabled
  },
}
EOF

"Auto Light/Dark theme configuration
lua <<EOF
local auto_dark_mode = require('auto-dark-mode')

auto_dark_mode.setup({
	update_interval = 1000,
	set_dark_mode = function()
		vim.api.nvim_set_option('background', 'dark')
		vim.cmd('colorscheme tokyonight-storm')
		vim.cmd('AirlineTheme violet')
	end,
	set_light_mode = function()
		vim.api.nvim_set_option('background', 'light')
		vim.cmd('colorscheme tokyonight-day')
		vim.cmd('AirlineTheme sol')
	end,
})
EOF
