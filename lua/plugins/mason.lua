return {
  {
    'williamboman/mason.nvim',
    lazy = true,  -- Lazy load mason.nvim
    event = "BufReadPre",  -- This can trigger the plugin early when files are opened
    config = function()
      -- Setup mason.nvim to ensure specific servers are installed
      require('mason').setup({
        ensure_installed = {"pyright", "clangd", "ts_ls", "texlab", "tinymist"},
      })
    end,
  },
  
  -- Your existing LSP plugin configurations
  {
    'neovim/nvim-lspconfig',
    lazy = true,  -- Lazy load LSP servers
    ft = { 'python', 'cpp', 'javascript', 'tex' },  -- Trigger when opening specific file types
    config = function()
      -- LSP Configuration goes here
      require('lspconfig').pyright.setup{
        on_attach = function(client, bufnr)
          -- Custom actions when Pyright attaches
        end
      }
      require('lspconfig').clangd.setup{
        on_attach = function(client, bufnr)
          -- Custom actions when Clangd attaches
        end
      }
     require('lspconfig').texlab.setup{
        on_attach = function(client, bufnr)
          -- Custom actions when TexLab attaches
        end,
      -- Include any other LSP server setups you have
  }  
  end,
  },
}

