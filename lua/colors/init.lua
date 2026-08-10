-- Black theme. Copied to lua/colors/init.lua by ~/nvim/bash/colors.sh.
return {
  {
    "tahayvr/matteblack.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("matteblack")
    end,
  },
}
