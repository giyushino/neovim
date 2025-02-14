return {
    {
      "xiyaowong/transparent.nvim",
      config = function()
        require("transparent").setup({
          groups = { -- Default groups to clear
            'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
            'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
            'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
            'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
            'EndOfBuffer',
          },
          extra_groups = {}, -- Extra groups to clear
          exclude_groups = {}, -- Groups to exclude from clearing
          on_clear = function() end, -- Callback function after clearing
        })

        -- Enable transparency immediately
        require("transparent").clear()
      end
    }
}
