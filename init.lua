vim.g.mapleader = ","
vim.g.maplocalleader = ","
vim.api.nvim_set_keymap('n', '<Space>', ':w<CR>', { noremap = true, silent = true })

vim.opt.tabstop = 4       -- Set the number of spaces a tab character occupies
vim.opt.shiftwidth = 4    -- Set the number of spaces for indentation
vim.opt.expandtab = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'no'

vim.api.nvim_set_keymap('i', '(', '()<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '[', '[]<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '{', '{}<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '"', '""<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '$', '$$<Left>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '.', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>n', ':setlocal spell spelllang=en_us<CR>', { noremap = true, silent = true })



function RunScript()
  local filetype = vim.bo.filetype
  if filetype == 'python' then
    -- Run Python script using Anaconda's Python interpreter
    vim.cmd('!C:/Users/allan/anaconda3/python.exe %')
  elseif filetype == 'javascript' then
    -- Run JavaScript with Node.js
    vim.cmd('!node %')
  else
    print("Unsupported file type")
  end
end

vim.api.nvim_set_keymap('n', '<leader>.', ':lua RunScript()<CR>', { noremap = true, silent = true })


-- Ensure lazy.nvim is installed and set it up
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "https://github.com/folke/lazy.nvim.git", lazypath })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  spec = {
    { import = "plugins" },  -- Import plugins from 'plugins/init.lua'
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
})
 
