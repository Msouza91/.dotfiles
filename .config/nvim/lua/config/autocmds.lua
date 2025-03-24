-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- Create a group for our autocmds
local trim_whitespace_group = vim.api.nvim_create_augroup("TrimWhitespace", { clear = true })

-- Create autocmd to trim trailing whitespace on save for specific filetypes
vim.api.nvim_create_autocmd("BufWritePre", {
  group = trim_whitespace_group,
  pattern = { "*.c", "*.cpp", "*.java", "*.php", "*.py", "*.js", "*.ts", "*.vim", "*.ps1", "*.psd1" },
  callback = function()
    -- Save cursor position
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    -- Remove trailing whitespace
    vim.cmd([[%s/\s\+$//e]])
    -- Restore cursor position
    vim.api.nvim_win_set_cursor(0, cursor_pos)
  end,
  desc = "Trim trailing whitespace on save",
})
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
