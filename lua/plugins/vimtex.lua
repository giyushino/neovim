return {
  {
    'lervag/vimtex',
    lazy = true, 
    ft = "tex",
    init = function()
      -- Vimtex configuration
      vim.g.vimtex_view_method = "general"
      vim.g.vimtex_view_pdf_method = "start"
      vim.g.vimtex_view_sioyek_inverse_search = "C:\\Program Files\\Neovim\\bin\\nvim.exe --headless -c \"VimtexInverseSearch %2 '%1'\""
      --
      vim.g.vimtex_view_forward_search = 1
      vim.g.vimtex_view_general_viewer = "C:/Users/allan/Downloads/sioyek-release-windows/sioyek-release-windows/sioyek.exe"
      --vim.g.vimtex_view_sumatra_executable = "C:/Users/allan/AppData/Local/SumatraPDF/SumatraPDF.exe"
    end,
    config = function()
      -- Key mappings
      vim.api.nvim_set_keymap('n', '<leader>l', ':VimtexCompile<CR>', { noremap = true, silent = true })
      -- Refresh LaTeX document
      vim.api.nvim_set_keymap('n', '<leader>t', ':VimtexView<CR>', { noremap = true, silent = true })
    end,
  },

  -- Other plugins...
}

