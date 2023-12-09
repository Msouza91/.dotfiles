vim.keymap.set("n", "<c-p>",
  "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
vim.keymap.set("n", "<c-b>",
  "<cmd>lua require('fzf-lua').buffers()<CR>", { silent = true })
vim.keymap.set("n", "<c-s>",
  "<cmd>lua require('fzf-lua').grep_cword()<CR>", { silent = true })
