return {
  {
    'neovim/nvim-lspconfig',
    lazy = false,
    ft = { 'python', 'cpp', },
    dependencies = { 'ray-x/lsp_signature.nvim' },
    config = function()
        local orig_notify = vim.notify
        vim.notify = function(msg, log_level, _opts)
          if msg:match("lspconfig") then return end  -- ignore lspconfig warnings
          orig_notify(msg, log_level, _opts)
        end

      local lspconfig = require('lspconfig')

      local signature_setup = {
        bind = true,
        hint_enable = true,
        handler_opts = { border = "rounded" },
      }

      -- python
      lspconfig.pyright.setup{ on_attach = on_attach }

      -- c/c++
      lspconfig.clangd.setup{ on_attach = on_attach }

      -- add more servers here
    end,
  },  -- <--- comma here if there are more plugins after
}

