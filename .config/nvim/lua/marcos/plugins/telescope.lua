return {
    'nvim-telescope/telescope.nvim',
    version = '0.1.5', -- or, branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<C-l>', builtin.lsp_references, {})
        vim.keymap.set('n', '<leader>ps', function()
            vim.ui.input({ prompt = 'Grep > ', cancel_on_esc = true }, function( input)
                    builtin.grep_string({ search = input })
                end)
        end)
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
    end
}
