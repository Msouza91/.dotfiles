return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        -- LSP Support
        'neovim/nvim-lspconfig',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',

        -- Autocompletion
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',

        -- Snippets
        'L3MON4D3/LuaSnip',
        'rafamadriz/friendly-snippets',
    },
    config = function ()
        local lsp = require("lsp-zero")

        lsp.preset("recommended")

        --- Setup Mason LSP Install
        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {
                'terraformls',
                'golangci_lint_ls',
                'lua_ls',
                'azure_pipelines_ls',
                'eslint',
                'dockerls',
                'docker_compose_language_service',
                'bashls',
            },
            handlers = {
                lsp.default_setup,
                lua_ls = function()
                    local lua_opts = lsp.nvim_lua_ls()
                    require('lspconfig').lua_ls.setup(lua_opts)
                end,
            },
        })

        --- Setup cmp completion
        local cmp = require('cmp')
        local cmp_format = require('lsp-zero').cmp_format()

        cmp.setup({
            formatting = cmp_format,
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-n>'] = cmp.mapping.select_next_item(),
                ['<C-p>'] = cmp.mapping.select_prev_item(),
                ['<C-e>'] = cmp.mapping.close(),
                ['<C-y>'] = cmp.mapping.confirm({select = false}),
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
            }),
            sources = {
                {name = 'nvim_lsp'},
                {name = 'luasnip', keyword_length = 2},
                {name = 'buffer', keyword_length = 3},
                {name = 'path'},
                {name = 'nvim_lua'},
            },
        })

        --- Setup Mapping and some prferences
        lsp.set_preferences({
            suggest_lsp_servers = false,
            sign_icons = {
                error = 'E',
                warn = 'W',
                hint = 'H',
                info = 'I'
            }
        })

        lsp.on_attach(function(client, bufnr)
            local opts = {buffer = bufnr, remap = false}

            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
            vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
            vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
            vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
            vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
            vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
            vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        end)

        lsp.setup()

        vim.diagnostic.config({
            virtual_text = true
        })
    end
}
