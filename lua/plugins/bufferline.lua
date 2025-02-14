return {
  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = "VeryLazy",
    config = function()
      require("bufferline").setup {
        options = {
          numbers = "ordinal", -- Show buffer numbers
          diagnostics = "nvim_lsp", -- Show LSP diagnostics
          --separator_style = "slant", -- Look & feel of the separator
          seperator_style = {" ", " "},
          show_buffer_close_icons = false, -- Hide close buttons
          show_close_icon = false, -- Hide global close icon
        }
      }

      -- Extend transparent groups to include bufferline highlights
      vim.g.transparent_groups = vim.list_extend(
        vim.g.transparent_groups or {},
        vim.tbl_map(function(v)
          return v.hl_group
        end, vim.tbl_values(require('bufferline.config').highlights))
      )
    end
  }
}

