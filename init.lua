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
  { 'folke/tokyonight.nvim' },            -- Tokyo Night colorscheme
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },  -- Telescope for fuzzy finding
  { 'folke/neodev.nvim', config = function() require('neodev').setup() end },  -- Neodev for Lua LSP
  {'github/copilot.vim',},
  {'nordtheme/vim'},
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {"junegunn/seoul256.vim"},
  {
  "olimorris/onedarkpro.nvim",
  --priority = 1000, -- Ensure it loads first
},
  {
  "folke/snacks.nvim",
  priority = 1000,},  
  { "andweeb/presence.nvim" }, 
  { "gbprod/yanky.nvim",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }},
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
--vim.cmd('colorscheme gruvbox')
--vim.cmd('colorscheme tokyonight')
--vim.cmd("colorscheme onedark_vivid")
--vim.cmd("colorscheme onedark_dark")
--vim.cmd("colorscheme catppuccin")
--vim.cmd("colorscheme nord")
vim.cmd("colorscheme seoul256")



-- Make the vertical split line transparent
vim.cmd([[highlight Normal guibg=NONE]])
vim.cmd([[highlight NormalNC guibg=NONE]])
vim.cmd([[highlight Pmenu guibg=NONE]])
vim.cmd([[highlight PmenuSel guibg=NONE]])
vim.cmd([[highlight VertSplit guibg=NONE]])
vim.cmd([[highlight StatusLine guibg=NONE]])
vim.cmd([[highlight StatusLineNC guibg=NONE]])
vim.cmd([[highlight TabLine guibg=NONE]])
vim.cmd([[highlight TabLineFill guibg=NONE]])
vim.cmd([[highlight TabLineSel guibg=NONE]])
-- Make all line number related highlight groups transparent
vim.cmd([[highlight LineNr guibg=NONE]])
vim.cmd([[highlight CursorLineNr guibg=NONE]])
vim.cmd([[highlight SignColumn guibg=NONE]])
vim.cmd([[highlight FoldColumn guibg=NONE]])
vim.cmd([[highlight DiffAdd guibg=NONE]])
vim.cmd([[highlight DiffChange guibg=NONE]])
vim.cmd([[highlight DiffDelete guibg=NONE]])
vim.cmd([[highlight DiffText guibg=NONE]])
vim.cmd([[highlight LineNr guibg=NONE]])
vim.cmd([[highlight CursorLineNr guibg=NONE]])
vim.cmd([[highlight ColorColumn guibg=NONE]])
-- Make search results transparent
vim.cmd([[highlight Search guibg=NONE guifg=#FFFF00]])  -- Optional text color
vim.cmd([[highlight IncSearch guibg=NONE guifg=#FFFF00]])  -- Optional text color


vim.cmd([[highlight TelescopeNormal guibg=NONE]])
vim.cmd([[highlight TelescopeBorder guibg=NONE]])
vim.cmd([[highlight TelescopePromptNormal guibg=NONE]])
vim.cmd([[highlight TelescopePromptBorder guibg=NONE]])
vim.cmd([[highlight TelescopeResultsNormal guibg=NONE]])
vim.cmd([[highlight TelescopeResultsBorder guibg=NONE]])
vim.cmd([[highlight TelescopePreviewNormal guibg=NONE]])
vim.cmd([[highlight TelescopePreviewBorder guibg=NONE]])
vim.cmd [[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NormalNC guibg=NONE ctermbg=NONE
  highlight NvimTreeNormal guibg=NONE ctermbg=NONE
  highlight NvimTreeNormalNC guibg=NONE ctermbg=NONE
]]


-- -- Setup for snacks.nvim dashboard
require("snacks").setup({
  dashboard = {
    width = 60,
    row = nil,
    col = nil,
    pane_gap = 4,
    autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
    preset = {
      keys = {
        { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
        { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
        { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
        { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
        { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
        { icon = " ", key = "s", desc = "Restore Session", section = "session" },
        { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
        { icon = " ", key = "q", desc = "Quit", action = ":qa" },
      },
      header = [[        
  _,-""`""-~`)                                   
(`~_,=========\                                  
 |---,___.-.__,\                                 
 |        o     \ ___  _,,,,_     _.--.          
  \      `^`    /`_.-"~      `~-;`     \         
   \_      _  .'                 `,     |        
     |`-           NEOVIM          \'__/         
    /                      ,_       \  `'-.      
   /    .-""~~--.            `"-,   ;_    /      
  |              \               \  | `""`       
   \__.--'`"-.   /_               |'             
  	      `"`  `~~~---..,     |              
	                     \ _.-'`-.           
	              \       \          
	               '.     /          
	         `"~"`]],

    },
    
    sections = {
      { section = "header" },
{
        pane = 2,
        section = "terminal",
        cmd = "echo No one is your enemy. You have no enemies at all",
        height = 2,
        padding = 17,
      },    
      { section = "keys", gap = 1, padding = 1, autohide = true },
      { pane = 2, icon = " ", title = "Chigga's Recent Files", section = "recent_files", limit = 10, indent = 2, padding = 2, height = 10, },  
      { section = "startup" },
    },
  },
})


vim.cmd([[highlight SnacksConfig guibg=NONE]])        -- Transparent background for the config popup
vim.cmd([[highlight SnacksRecentFiles guibg=NONE]])   -- Transparent background for recent files popup
vim.cmd([[highlight SnacksFindFile guibg=NONE]])      -- Transparent background for Find File popup
vim.cmd([[highlight SnacksTerminalPopup guibg=NONE]]) -- Transparent background for terminal popup in dashboard
vim.cmd([[highlight SnacksPopup guibg=NONE]])




-- Setup nvim-cmp with LuaSnip for snippets
local cmp = require('cmp')
cmp.setup({
  completion = {
    autocomplete = { cmp.TriggerEvent.TextChanged, cmp.TriggerEvent.InsertLeave },
  },
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(),  -- Trigger completion manually
    ['<CR>'] = cmp.mapping.confirm({ select = true }),  -- Confirm selected completion
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),  -- Move to next completion item (using Ctrl+n)
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),  -- Move to previous completion item (using Ctrl+p)
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
    neovim_image_text   = "i spent way too much fucking time configuring this shit", -- Text displayed when hovered over the Neovim image
    main_image          = "neovim",                   -- Main image display (either "neovim" or "file")
    client_id           = "793271441293967371",       -- Use your own Discord application client id (not recommended)
    log_level           = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
    debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
    enable_line_number  = false,                      -- Displays the current line number instead of the current project
    blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
    buttons             = true,                       -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
    file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
    show_time           = true,                       -- Show the timer

    -- Rich Presence text options
    editing_text        = "probably fucking up %s",               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
    file_explorer_text  = "browsing %s",              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
    git_commit_text     = "committing changes",       -- Format string rendered when committing changes in git (either string or function(filename: string): string)
    plugin_manager_text = "managing plugins",         -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
    reading_text        = "reading %s",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
    workspace_text      = "working on %s",            -- Working on %s Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
    line_number_text    = "Line %s out of %s",        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
})



vim.keymap.set("n", "y", "<Plug>(YankyYank)") -- Enhance yank
vim.keymap.set("n", "<leader>p", '"+p')      -- Paste from system clipboard
vim.keymap.set("n", "<leader>y", '"+y')      -- Yank to system clipboard

-- Map the spacebar to save the file
vim.api.nvim_set_keymap('n', '<Space>', ':w<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', ',n', ':q<CR>', { noremap = true, silent = true })

vim.g.mapleader = ","
-- Compile LaTeX file
vim.api.nvim_set_keymap('n', '<leader>l', ':VimtexCompile<CR>', { noremap = true, silent = true })

-- Refresh LaTeX document
vim.api.nvim_set_keymap('n', '<leader>r', ':VimtexView<CR>', { noremap = true, silent = true })
-- Remap `,tree` to `NvimTreeToggle`
vim.api.nvim_set_keymap('n', '<leader>m', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
-- Map <leader>r to run the current Python file
--vim.api.nvim_set_keymap('n', '<leader>r', ':w<CR>:!python3 %<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>.', ':w<CR>:!C:/Users/allan/anaconda3/python.exe %<CR>', { noremap = true, silent = true })

require('telescope').setup {
  defaults = {
    layout_config = {
      preview_width = 0.65,  -- The width of the preview window (for horizontal and flex layouts)
      width = 0.8,           -- The width of the picker (adjust as necessary)
      height = 0.8,          -- The height of the picker (adjust as necessary)
    },
    sorting_strategy = "ascending",  -- Sorting strategy
    layout_strategy = "center",       -- Flex layout (automatic adjustment)
  },
  pickers = {
    find_files = {
      theme = "ivy",  -- Apply 'ivy' theme to find_files picker
    },
    oldfiles = {
      theme = "ivy",  -- Apply 'ivy' theme to oldfiles picker
    },
  },
}

-- Disable default Tab mapping for Copilot
vim.g.copilot_no_tab_map = true

-- Map <Tab> to accept Copilot suggestion
vim.api.nvim_set_keymap('i', '<Tab>', 'copilot#Accept()', { expr = true, silent = true })




vim.g.nvim_tree_width = 50

vim.keymap.set("n", "<leader>d", function()
  require("snacks").dashboard.open()
end, { desc = "Open Snacks Dashboard" })
