-- Red theme colors
return {
  name = "red",
  colorscheme = "ashen",
  plugin = "ficcdaf/ashen.nvim",

  -- Syntax highlights (nightfox groups)
  highlights = {
    NonText = "#e8a0a0",
    Comment = "#a8c4ec",
    String = "#83a0ce",
    Number = "#5d8be2",
    ["@variable"] = "#93b7f2",
    ["@variable.parameter"] = "#53a1e0",
    ["@parameter"] = "#3471eb",
    Parameter = "#3471eb",
    ["@keyword.function"] = "#5f8dd9",
    Function = "#6d9cd3",
    ["@keyword.return"] = "#6287bb",
    Conditional = "#548ee3",
    Constant = "#5478f6",
    ["@constant.builtin"] = "#6276bb",
    PreProc = "#5a90e8",
    ["@function.builtin"] = "#5683fb",
    ["@module"] = "#91c7e4",
    ["@constructor"] = "#7784d5",
    ["@variable.builtin"] = "#78aae7",
    ["@punctuation.special"] = "#0868dc",
    Type = "#6272ff",
    ["@type.builtin"] = "#6272ff",
    keyword = "#657fda",
  },

  -- Extra highlights set after colorscheme loads
  extra_highlights = {
    LspSignatureActiveParameter = { fg = "#B19CD7", bold = true },
    Statement = { fg = "#8ecdc8", italic = true },
    Conceal = { fg = "#a8c4ec" },
    texNormal = { fg = "#a8c4ec" },
    -- Snacks Dashboard
    SnacksDashboardDir = { link = "NonText" },
    SnacksDashboardHeader = { fg = "#e8a0a0" },
    SnacksDashboardIcon = { fg = "#e8a0a0" },
    SnacksDashboardKey = { fg = "#e8a0a0" },
    SnacksDashboardDesc = { fg = "#e8a0a0" },
    SnacksDashboardFooter = { fg = "#e8a0a0" },
    SnacksDashboardTitle = { fg = "#e8a0a0" },
    -- NvimTree
    NvimTreeNormal = { fg = "#e8a0a0", bg = "None" },
    NvimTreeFolderName = { fg = "#e8a0a0" },
    NvimTreeOpenedFolderName = { fg = "#e8a0a0", bold = true },
    NvimTreeEmptyFolderName = { fg = "#c08080" },
    NvimTreeRootFolder = { fg = "#e8a0a0", bold = true },
    NvimTreeSymlink = { fg = "#e8a0a0" },
    NvimTreeGitDirty = { fg = "#d19a66" },
    NvimTreeGitNew = { fg = "#e8a0a0" },
    NvimTreeGitDeleted = { fg = "#c08080" },
    NvimTreeSpecialFile = { fg = "#e8a0a0", underline = true },
  },

  -- Lualine colors
  lualine = {
    bg_dark = "#3B4252",
    bg_mid = "#4C566A",
    fg = "#E5E9F0",
    fg_bright = "#ECEFF4",
    accent = "#93b7f2",
    accent_alt = "#8FBCBB",
    warning = "#EBCB8B",
  },
}
