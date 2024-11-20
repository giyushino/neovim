-- Initialize Lazy.nvim and configure plugins
require("lazy").setup({
  -- Plugin list goes here
  { 'williamboman/mason.nvim', config = function() require('mason').setup() end },
  { 'williamboman/mason-lspconfig.nvim', config = function() require('mason-lspconfig').setup() end },
  { 'neovim/nvim-lspconfig' },            -- LSP support
  { 'hrsh7th/nvim-cmp' },                 -- Autocompletion plugin
  { 'hrsh7th/cmp-nvim-lsp' },             -- LSP source for nvim-cmp
  { 'hrsh7th/cmp-buffer' },               -- Buffer source for nvim-cmp
  { 'hrsh7th/cmp-path' },                 -- Path source for nvim-cmp
  { 'saadparwaiz1/cmp_luasnip' },         -- Snippets completion
  { 'L3MON4D3/LuaSnip' },                 -- Snippet engine
  { "morhetz/gruvbox" },                  -- Gruvbox colorscheme
  { "nvim-treesitter/nvim-treesitter" },  -- Treesitter for syntax highlighting
  { "folke/snacks.nvim" },                -- Snacks dashboard plugin
  { 'folke/tokyonight.nvim' },            -- Tokyo Night colorscheme
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },  -- Telescope for fuzzy finding
  { 'folke/neodev.nvim', config = function() require('neodev').setup() end },  -- Neodev for Lua LSP
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({
        -- You can add custom settings here if needed
      })
    end
  },
  -- VimTeX plugin with SumatraPDF integration
  { 'lervag/vimtex', lazy = false, init = function()
    vim.g.vimtex_view_method = "general"
    vim.g.vimtex_view_pdf_method = "start"
    vim.g.vimtex_view_forward_search = 1
    vim.g.vimtex_view_sumatra_executable = "C:/Users/allan/Downloads/SumatraPDF-3.5.2-64/SumatraPDF-3.5.2-64.exe"
  end },
})

vim.opt.number = true
-- Set colorscheme after plugins are installed
vim.cmd('colorscheme gruvbox')
--vim.cmd('colorscheme tokyonight')

-- Setup for snacks.nvim dashboard
require("snacks").setup({
  dashboard = {
    width = 60,
    row = nil,
    col = nil,
    pane_gap = 4,
    autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
    preset = {
      keys = {
        { icon = "🧌 ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
        { icon = "🧌 ", key = "n", desc = "New File", action = ":ene | startinsert" },
        { icon = "🧌 ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
        { icon = "🧌 ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
        { icon = "🧌 ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
        { icon = "🧌 " , key = "s", desc = "Restore Session", section = "session" },
        { icon = "🧌 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
        { icon = "🧌 ", key = "q", desc = "Quit", action = ":qa" },
      },
      header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
    },
    sections = {
      { section = "header" },
      { section = "keys", gap = 1, padding = 1 },
      { section = "startup" },
    },
  },
})

-- Setup nvim-cmp with LuaSnip for snippets
local cmp = require('cmp')
cmp.setup({
  completion = {
    autocomplete = { cmp.TriggerEvent.TextChanged, cmp.TriggerEvent.InsertLeave },
  },
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'luasnip' },
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})

-- Set up LSP for Lua (LuaLS)
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.lua_ls.setup({
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

-- Set up LSP for Pyright with Pylint
lspconfig.pyright.setup({
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",  -- You can set this to "strict" for more detailed linting
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
      linting = {
        enabled = true,
        pylintEnabled = true,  -- Ensure pylint is enabled
        lintOnSave = true,     -- Lint on save
        args = { "--max-line-length=100" }  -- Example argument for pylint (optional)
      },
    },
  },
})

-- Ensure mason installs Pyright and Pylint
require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { 'pyright', 'pylint' },
})

-- Setup LSP for Pyright (Python) with Pylint
lspconfig.pyright.setup({
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",  -- You can set this to "strict" for more detailed linting
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
      linting = {
        enabled = true,              -- Enable linting (via pylint)
        pylintEnabled = true,        -- Ensure pylint is enabled
        lintOnSave = true,           -- Lint when saving files
        args = { "--max-line-length=100" }  -- Example to set max line length for pylint
      },
    },
  },
})

-- Configure Mason for LSPs and ensure Pyright and Pylint are installed
require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { 'pyright' },
})

vim.cmd([[
  " Change the color of the completion item abbreviation (text)
  highlight CmpItemAbbr guifg=#89CFF0    " Change to your desired color (e.g., green)

  " Change the color for matched text in completion suggestions
  highlight CmpItemAbbrMatch guifg=#9966CB  " Change to pink for matches

  " Highlight fuzzy matches with a different color
  highlight CmpItemAbbrMatchFuzzy guifg=#66D9EF  " Change to cyan for fuzzy matches

  " Change the color for the completion item kind (e.g., function, method)
  highlight CmpItemKind guifg=#F8F8F2  " Set to white, adjust to your preference

  " Change the color for the menu (details) for completion items
  highlight CmpItemMenu guifg=#75715E  " Set to gray, adjust to your preference
]])

-- Optional: You can also change the background for specific completion categories
-- These are useful when you want to distinguish different categories like function, method, etc.
vim.cmd([[
  highlight CmpItemKindFunction guifg=#F8F8F2 gui=bold
  highlight CmpItemKindMethod guifg=#66D9EF gui=italic
  highlight CmpItemKindVariable guifg=#F92672 gui=bold
]])


