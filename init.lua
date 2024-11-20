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
    'andweeb/presence.nvim',
    config = function()
      require('presence').setup()
    end
  },
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
    --vim.g.vimtex_view_sioyek_inverse_search = "C:\\Program Files\\Neovim\\bin\\nvim.exe --headless -c \"VimtexInverseSearch %2 '%1'\""
    vim.g.vimtex_view_forward_search = 1
    vim.g.vimtex_view_sumatra_executable = "C:/Users/allan/AppData/Local/SumatraPDF/SumatraPDF.exe"
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
      { icon = "🧌 ", key = "s", desc = "Restore Session", section = "session" },
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

-- The setup config table shows all available config options with their default values:
require("presence").setup({
    -- General options
    auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
    neovim_image_text   = "too much fucking work for this shit", -- Text displayed when hovered over the Neovim image
    main_image          = "neovim",                   -- Main image display (either "neovim" or "file")
   -- client_id           = "793271441293967371",       -- Use your own Discord application client id (not recommended)
    log_level           = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
    debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
    enable_line_number  = false,                      -- Displays the current line number instead of the current project
    blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
    buttons             = true,                       -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
    file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
    show_time           = true,                       -- Show the timer

    -- Rich Presence text options
    editing_text        = "I FUCKING HATE EDITING %s",               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
    file_explorer_text  = "Browsing %s",              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
    git_commit_text     = "Committing changes",       -- Format string rendered when committing changes in git (either string or function(filename: string): string)
    plugin_manager_text = "Managing plugins",         -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
    reading_text        = "Reading %s",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
    workspace_text      = "Working on %s",            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
    line_number_text    = "Line %s out of %s",        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
})
