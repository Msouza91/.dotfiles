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
local cmp_action = require('lsp-zero').cmp_action()

  cmp.setup({
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-n>'] = cmp_action.luasnip_jump_forward(),
      ['<C-p>'] = cmp_action.luasnip_jump_backward(),
    })
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
