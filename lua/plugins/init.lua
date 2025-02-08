return {
    {
      "stevearc/conform.nvim",
      -- event = 'BufWritePre', -- uncomment for format on save
      opts = require "configs.conform",
    },
  
    -- These are some examples, uncomment them if you want to see them work!
    {
      "neovim/nvim-lspconfig",
      config = function()
        require "configs.lspconfig"
      end,
    },
    {
      "folke/snacks.nvim",
      priority = 1000,
      config = function()
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
                    { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                    { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                    { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                    { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
                    { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                  },
                header = [[
            
             █████╗ ██╗     ██╗      █████╗ ███╗   ██╗
            ██╔══██╗██║     ██║     ██╔══██╗████╗  ██║
            ███████║██║     ██║     ███████║██╔██╗ ██║
            ██╔══██║██║     ██║     ██╔══██║██║╚██╗██║
            ██║  ██║███████╗███████╗██║  ██║██║ ╚████║
            ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝
                ]],
              },    
                sections = {
                  { section = "header" },
                  {
                    pane = 2,
                    section = "terminal",
                    cmd = "echo I'm smart enough to know that I'm dumb - Richard Feynman",
                    height = 1,
                    padding = 9,
                   },    
                  { section = "keys", gap = 1, padding = 1, autohide = true },
                  { pane = 2, icon = " ", title = "Allan's Recent Files", section = "recent_files", limit = 10, indent = 2, padding = 2, height = 10, }, 	  {section = "startup"},
                },
              },
            })
          end,     
  },
  {
    "nvim-tree/nvim-tree.lua",
    event = "VeryLazy",
    config = function()
      require("nvim-tree").setup({
	      vim.keymap.set("n", "<leader>m", ":NvimTreeToggle<CR>", { desc = "Toggle Nvim Tree", silent = true })
        -- You can add custom settings here if needed
      })
    end
  },
} 
