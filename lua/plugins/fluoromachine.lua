return {
  {
    "maxmx03/fluoromachine.nvim",
    config = function()
      local fm = require 'fluoromachine'

      fm.setup {
        glow = false,
        theme = 'retrowave',  -- Your theme choice
        transparent = true,
        plugins = {
          neotree = true,
        }
      }

      -- Apply the theme after configuring the plugin
      vim.cmd.colorscheme 'fluoromachine'
    end,
  },

  -- Other plugins...
}

