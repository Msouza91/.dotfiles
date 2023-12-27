return {
    'stevearc/conform.nvim',
    event = {'BufReadPre', 'BufNewFile'},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                -- Conform will run multiple formatters sequentially
                yaml = { "yamlfmt"},
            },
            format_on_save = {
                -- These options will be passed to conform.format()
                timeout_ms = 500,
                lsp_fallback = true,
            },
        })
    end,
}
