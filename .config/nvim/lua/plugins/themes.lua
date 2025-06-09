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
    vim.cmd("colorscheme ayu")
    if vim.o.background == "dark" then
      vim.g.ayu_style = "dark"
    else
      vim.g.ayu_style = "light"
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
