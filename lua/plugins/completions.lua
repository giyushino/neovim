return {
    {
      'hrsh7th/nvim-cmp',
      event = 'InsertEnter',
      config = function()
        local cmp = require('cmp')
        local ts_utils = require('nvim-treesitter.ts_utils') -- Load Treesitter utilities

        cmp.setup({
          completion = {
            autocomplete = { cmp.TriggerEvent.TextChanged, cmp.TriggerEvent.InsertLeave },
          },
          mapping = {
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<Tab>'] = cmp.mapping.confirm({ select = true }),
            ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
            ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
            ['<C-m>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
          },
          sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'buffer' },
            { name = 'path' },
            { name = 'luasnip', keyword_length = 2 }, -- Only show snippets after typing 2 characters
          }),
          snippet = {
            expand = function(args)
              require('luasnip').lsp_expand(args.body)
            end,
          },
          enabled = function()
            -- Use Treesitter to check if the cursor is inside a function argument list
            local node = ts_utils.get_node_at_cursor()
            while node do
              -- Check if the node type is a function argument list
              if node:type() == 'argument_list' then
                return false -- Disable completion inside function arguments
              end
              node = node:parent() -- Move up the syntax tree
            end
            return true -- Enable completion otherwise
          end,
        })
      end,
    }, 
  {
    'hrsh7th/cmp-nvim-lsp',
    lazy = true,
    event = 'InsertEnter',
  },
  {
    'hrsh7th/cmp-buffer',
    lazy = true,
    event = 'InsertEnter',
  },
  {
    'hrsh7th/cmp-path',
    lazy = true,
    event = 'InsertEnter',
  },
  {
    'L3MON4D3/LuaSnip',
    lazy = true,
    event = 'InsertEnter',
  },
}

