return {
  "HiPhish/rainbow-delimiters.nvim",
  opts = {
    strategy = {
      [""] = "rainbow-delimiters.strategy.global",
      commonlisp = "rainbow-delimiters.strategy.local",
    },
    query = {
      [""] = "rainbow-delimiters",
      latex = "rainbow-blocks",
    },
    highlight = {
      "RainbowDelimiterYellow",
      "RainbowDelimiterCyan",
      "RainbowDelimiterBlue",
      "RainbowDelimiterGreen",
      "RainbowDelimiterOrange",
      "RainbowDelimiterRed",
      "RainbowDelimiterViolet",
    },
    blacklist = { "c", "cpp" },
  },
  config = function(_, opts)
    require("rainbow-delimiters.setup").setup(opts)
  end,
}
