--. This file can be loaded by calling `lua require('plugins')` from your init.vim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
    { 'Bekaboo/deadcolumn.nvim' },
    { 'tridactyl/vim-tridactyl' },
    { "epwalsh/obsidian.nvim",
    version = "*",  -- recommended, use latest release instead of latest commit
    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",
    }},

    { 'nvim-telescope/telescope.nvim', version = '0.1.5',
    -- or                            , branch = '0.1.x',
    dependencies = { {'nvim-lua/plenary.nvim'} }
},

{ "ThePrimeagen/harpoon",
branch = "harpoon2",
dependencies = { {"nvim-lua/plenary.nvim"} }
    },

    --Themes
    { 'f-person/auto-dark-mode.nvim',
    dependencies = { 'rose-pine/neovim' }
},

{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
},

{
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
},

{('github/copilot.vim') },
{('tpope/vim-surround') },
{('tpope/vim-fugitive') },
{('mbbill/undotree') },
{ 'VonHeikemen/lsp-zero.nvim',
branch = 'v1.x',
dependencies = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'saadparwaiz1/cmp_luasnip'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-nvim-lua'},

    -- Snippets
    {'L3MON4D3/LuaSnip'},
    {'rafamadriz/friendly-snippets'},
}
    },
    { 'GeekMasher/securitree.nvim',
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "MunifTanjim/nui.nvim"
    },
},
{ 'preservim/nerdcommenter' },
{ { 'justinhj/battery.nvim', dependencies = {
    {'nvim-tree/nvim-web-devicons'},
    {'nvim-lua/plenary.nvim'}}
},
}
}

require("lazy").setup(plugins)
