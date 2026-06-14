return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
  },
  config = function()
    -- advertise nvim-cmp's extra completion capabilities to every server
    vim.lsp.config("*", {
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
    })

    require("mason-lspconfig").setup({
      -- servers auto-installed via Mason, then auto-enabled/attached
      ensure_installed = {
        "pyright", -- python
        "clangd",  -- c and c++
        "zls",     -- zig
      },
      -- automatic_enable defaults to true: installed servers are
      -- enabled with vim.lsp.enable() and attach on matching filetypes
    })
  end,
}
