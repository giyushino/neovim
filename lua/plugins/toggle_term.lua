return {
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require('toggleterm').setup{
        size = 20,
        open_mapping = [[<leader>;]],
        direction = "float", 
        shade_terminals = true, 
        shading_factor = 2,
        start_in_insert = true,
        persist_size = true,
        float_ops = {
          border = "rounded",
          winblend = 20,
        },
      }
    end,
  },

  -- Other plugins...
}

