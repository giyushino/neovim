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
--[[
return {
    {
      'sainnhe/everforest',
      lazy = false,
      priority = 1000,
      config = function()
        -- Optionally configure and load the colorscheme
        -- directly inside the plugin declaration.
        transparent = true
        vim.g.everforest_enable_italic = true
        vim.cmd.colorscheme('everforest')
      end
    }
}
--]]
