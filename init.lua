vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.api.nvim_set_keymap('n', '<leader>w', ':w<cr>', { desc = "save file" } )
vim.opt.tabstop = 4       -- Set the number of spaces a tab character occupies
vim.opt.shiftwidth = 4    -- Set the number of spaces for indentation
vim.opt.expandtab = true
-- vim.opt.showmode = true -- not sure what this does
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'no'
vim.opt.swapfile = false
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
-- vim.opt.concealcursor = "n"
-- vim.opt["guicursor"] = "" 
vim.api.nvim_create_user_command('Q', 'q', {})

-- vim.opt.hlsearch = false
vim.opt.incsearch = true 
vim.opt.smartcase = true
vim.opt.ignorecase = true

-- vim.g.neovide_opacity = 0.3
-- vim.g.transparency = 0

require("configs.lazy")

-- snacks keybinds
vim.keymap.set("n", "<leader>e", function() require("snacks").explorer() end, { desc = "File explorer" })
vim.keymap.set("n", "<leader>f", function() require("snacks").picker.files() end, { desc = "Find files" })
vim.keymap.set("n", "<leader>g", function() require("snacks").picker.grep() end, { desc = "Find text (grep)" })
-- i might want to change this later
-- vim.keymap.set("n", "<leader>r", function() require("snacks").picker.recent() end, { desc = "Recent files" })
