return {
  {
    "pxwg/math-conceal.nvim",
    lazy = true, -- optional, implied by ft
    ft = { "tex", "markdown", "typst" }, -- correct filetypes
    build = "make lua51",
    main = "math-conceal",
    --- @type LaTeXConcealOptions
    opts = {
      enabled = true,
      conceal = {
        "greek",
        "script",
        "math",
        "font",
        "delim",
        "phy",
      },
      ft = { "*.tex", "*.md", "*.typ" }, -- this is plugin-specific, not for Lazy
    },
  },
}

--return {
--
--  "pxwg/math-conceal.nvim",
--  lazy = true, 
--  ft = "tex",
--  event = "VeryLazy",
--  build = "make lua51",
--  main = "math-conceal",
--  --- @type LaTeXConcealOptions
--  opts = {
--    enabled = true,
--    conceal = {
--      "greek",
--      "script",
--      "math",
--      "font",
--      "delim",
--      "phy",
--    },
--    ft = { "*.tex", "*.md", "*.typ" },
--  },
--}
