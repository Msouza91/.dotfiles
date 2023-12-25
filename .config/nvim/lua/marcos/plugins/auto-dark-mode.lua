return {
    'f-person/auto-dark-mode.nvim',
    event = 'VimEnter',
    dependencies = { 'rose-pine/neovim' },
    config = function()
        local auto_dark_mode = require('auto-dark-mode')

        auto_dark_mode.setup({
            update_interval = 1000,
            set_dark_mode = function()
                vim.cmd('colorscheme rose-pine')
                vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
                vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
            end,
            set_light_mode = function()
                vim.cmd('colorscheme rose-pine')
                vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
                vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
            end,
        })
    end
}
