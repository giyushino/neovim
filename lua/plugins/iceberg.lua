return {
  "cocopon/iceberg.vim",
  priority = 1000, -- load before other UI plugins
  lazy = false,
  config = function()
    vim.cmd("colorscheme iceberg")

    -- Make the background transparent
    local transparent_groups = {
      "Normal",
      "NormalNC",
      "NormalFloat",
      "SignColumn",
      "EndOfBuffer",
      "LineNr",
      "CursorLineNr",
      "VertSplit",
      "WinSeparator",
      "StatusLine",
      "StatusLineNC",
      "FoldColumn",
      "Folded",
      "Pmenu",
    }
    for _, group in ipairs(transparent_groups) do
      vim.api.nvim_set_hl(0, group, { bg = "none" })
    end

    -- Snacks picker highlights
    vim.api.nvim_set_hl(0, "SnacksPickerDir", { fg = "#8E8E8E", bg = "none" })
    vim.api.nvim_set_hl(0, "SnacksPickerFile", { fg = "#FFFFFF", bg = "none" })
    vim.api.nvim_set_hl(0, "SnacksBorder", { fg = "#585858", bg = "none" })

    -- Snacks dashboard highlights
    vim.api.nvim_set_hl(0, "Special", { fg = "#84a0c6" })
    vim.api.nvim_set_hl(0, "NonText", { fg = "#ffffff" })
    vim.api.nvim_set_hl(0, "SnacksDashboardDir", { link = "NonText" })
    vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = "#84a0c6" })
    vim.api.nvim_set_hl(0, "SnacksDashboardIcon", { fg = "#84a0c6" })
    vim.api.nvim_set_hl(0, "SnacksDashboardKey", { fg = "#89b8c2" })
    vim.api.nvim_set_hl(0, "SnacksDashboardDesc", { fg = "#84a0c6" })
    vim.api.nvim_set_hl(0, "SnacksDashboardFooter", { fg = "#6b7089" })
    vim.api.nvim_set_hl(0, "SnacksDashboardTitle", { fg = "#84a0c6" })
  end,
}
