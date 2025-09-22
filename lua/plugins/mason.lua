return {
  {
    'williamboman/mason.nvim',
    lazy = false,
    config = function()
      require('mason').setup()
    end,
  },

  {
    'williamboman/mason-lspconfig.nvim',
    lazy = false,
    dependencies = { 'williamboman/mason.nvim' },
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = { "pyright", "clangd", "texlab", "tinymist", "ocamllsp", "eslint", "vtsls", "html", "lua_ls" },
        automatic_installation = true,
      })
    end,
  },

  {
    'neovim/nvim-lspconfig',
    lazy = false,
    ft = { 'python', 'cpp', 'javascript', 'tex', 'ml', 'typ', 'html', 'lua' },
    dependencies = { 'ray-x/lsp_signature.nvim' },
    config = function()
      local lspconfig = require('lspconfig')

      -- Signature helper
      local signature_setup = {
        bind = true,
        hint_enable = true,
        handler_opts = { border = "rounded" },
      }
      local on_attach = function(client, bufnr)
        pcall(require('lsp_signature').on_attach, signature_setup, bufnr)
      end

      ---------------------------------------------------
      -- Python
      ---------------------------------------------------
      vim.lsp.config['pyright'] = {
        on_attach = on_attach,
      }

      ---------------------------------------------------
      -- C/C++
      ---------------------------------------------------
      vim.lsp.config['clangd'] = {
        on_attach = on_attach,
        cmd = { "clangd", "--header-insertion=iwyu", "--query-driver=/usr/bin/g++" },
        init_options = { clangdFileStatus = true },
        settings = {
          clangd = {
            arguments = {
              "-I/opt/libtorch/include",
              "-I/opt/libtorch/include/torch/csrc/api/include",
              "-std=c++17",
              "-D_GLIBCXX_USE_CXX11_ABI=1",
            },
          },
        },
      }

      ---------------------------------------------------
      -- OCaml
      ---------------------------------------------------
      vim.lsp.config['ocamllsp'] = {
        on_attach = on_attach,
      }

      ---------------------------------------------------
      -- TeX
      ---------------------------------------------------
      vim.lsp.config['texlab'] = {
        on_attach = on_attach,
      }

      ---------------------------------------------------
      -- HTML
      ---------------------------------------------------
      vim.lsp.config['html'] = {
        on_attach = on_attach,
      }

      ---------------------------------------------------
      -- TypeScript / JavaScript
      ---------------------------------------------------
      vim.lsp.config['vtsls'] = {
        on_attach = on_attach,
      }

      ---------------------------------------------------
      -- Tinymist
      ---------------------------------------------------
      if vim.lsp.config['tinymist'] then
        vim.lsp.config['tinymist'].on_attach = on_attach
      end

      ---------------------------------------------------
      -- ESLint
      ---------------------------------------------------
      if vim.lsp.config['eslint'] then
        vim.lsp.config['eslint'].on_attach = on_attach
      end

      ---------------------------------------------------
      -- Lua
      ---------------------------------------------------
      vim.lsp.config['luals'] = {
        on_attach = on_attach,
        cmd = { 'lua-language-server' },
        filetypes = { 'lua' },
        root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = { 'vim' } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
          },
        },
      }
    end,
  },
}
