return {
  "Shatur/neovim-ayu",
  name = "ayu",
  lazy = false,
  config = function()
    local opts = {
      mirage = false,
      terminal = true,
      overrides = {},
    }
    require("ayu").setup(opts)
    if vim.o.background == "dark" then
      vim.cmd("colorscheme ayu-dark")
    else
      vim.cmd("colorscheme ayu-light")
    end
  end,
}

-- return {
-- 	"neanias/everforest",
-- 	name = "everforest",
-- 	lazy = false,
-- 	config = function()
-- 		vim.cmd("colorscheme everforest")
-- 		--vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- 		--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- 		vim.g.everforest_background = "hard"
-- 	end,
-- }
