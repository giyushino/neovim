-- Gold theme (light). Copied to lua/colors/init.lua by ~/nvim/bash/colors.sh.
return {
  {
    "Mofiqul/adwaita.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = "light"
      vim.cmd.colorscheme("adwaita")
    end,
  },
}
