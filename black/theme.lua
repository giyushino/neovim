return {
  {
    "wnkz/monoglow.nvim",
    lazy = false,       -- load immediately
    priority = 1000,    -- load before other plugins
    opts = {},          -- configuration options, empty for now
    config = function()
      require('monoglow').setup({})
      vim.cmd("colorscheme monoglow")  -- actually load the colorscheme
      vim.api.nvim_set_hl(0, "SnacksPickerDir", { fg = "#8E8E8E", bg = "None" })
      vim.api.nvim_set_hl(0, "SnacksPickerFile", { fg = "#FFFFFF", bg = "None" })
      vim.api.nvim_set_hl(0, "SnacksBorder", { fg = "#585858", bg = "None" })
      vim.api.nvim_set_hl(0, "Normal", { fg = "#ffffff", bg = "#1c1c1c" })
    end
  }
}
