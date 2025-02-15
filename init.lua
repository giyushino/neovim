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

vim.api.nvim_set_keymap('n', 'f', ':lua Snacks.dashboard.pick()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>m', ':lua Snacks.picker.explorer()<CR>', { noremap = true, silent = true })

vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>bp", "<Cmd>BufferLinePick<CR>", { noremap = true, silent = true })


vim.opt.termguicolors = true

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

vim.api.nvim_set_keymap('n', 'f', ':lua Snacks.dashboard.pick()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>m', ':lua Snacks.picker.explorer()<CR>', { noremap = true, silent = true })


function RunScript()
  local filetype = vim.bo.filetype
  if filetype == 'python' then
    -- Read the first few lines to find the Conda env comment
    local lines = vim.fn.getline(1, 5)
    local env_name

    for _, line in ipairs(lines) do
      env_name = line:match("#%s*conda_env:%s*(%S+)")
      if env_name then break end
    end

    -- Set the appropriate Python executable
    local python_cmd
    if env_name then
      python_cmd = "C:/Users/allan/anaconda3/envs/" .. env_name .. "/python.exe"
    else
      python_cmd = "C:/Users/allan/anaconda3/python.exe"  -- Default to base Python
    end

    -- Run the script with the detected interpreter
    vim.cmd('! ' .. python_cmd .. ' %')

  elseif filetype == 'javascript' then
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
 
