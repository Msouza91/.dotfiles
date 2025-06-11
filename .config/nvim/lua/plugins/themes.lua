return {
  "webhooked/kanso.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    -- Default options:
    require("kanso").setup({
      bold = true, -- enable bold fonts
      italics = true, -- enable italics
      compile = false, -- enable compiling the colorscheme
      undercurl = true, -- enable undercurls
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = {},
      typeStyle = {},
      transparent = false, -- do not set background color
      dimInactive = false, -- dim inactive window `:h hl-NormalNC`
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
      colors = { -- add/modify theme and palette colors
        palette = {},
        theme = { zen = {}, pearl = {}, ink = {}, all = {} },
      },
      overrides = function(colors) -- add/modify highlights
        return {}
      end,
      theme = "zen", -- Load "zen" theme
      background = { -- map the value of 'background' option to a theme
        dark = "zen", -- try "ink" !
        light = "pearl", -- try "mist" !
      },
    })

    -- setup must be called before loading
    vim.cmd("colorscheme kanso")
  end,
}
-- return {
--   "Shatur/neovim-ayu",
--   name = "ayu",
--   lazy = false,
--   config = function()
--     local opts = {
--       mirage = false,
--       terminal = true,
--       overrides = function()
--         if vim.o.background == "dark" then
--           return { NormalNC = { bg = "#0f151e", fg = "#808080" } }
--         else
--           return { NormalNC = { bg = "#dcdad7", fg = "#808080" } }
--         end
--       end,
--     }
--     require("ayu").setup(opts)
--     vim.cmd("colorscheme ayu")
--     if vim.o.background == "dark" then
--       vim.g.ayu_style = "dark"
--     else
--       vim.g.ayu_style = "light"
--     end
--   end,
-- }

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
