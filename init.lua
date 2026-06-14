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

vim.o.timeoutlen = 300

-- vim.g.neovide_opacity = 0.3
-- vim.g.transparency = 0

require("configs.lazy")

-- snacks keybinds
vim.keymap.set("n", "<leader>e", function() require("snacks").explorer() end, { desc = "File explorer" })
vim.keymap.set("n", "<leader>f", function() require("snacks").picker.files() end, { desc = "Find files" })
vim.keymap.set("n", "<leader>g", function() require("snacks").picker.grep() end, { desc = "Find text (grep)" })
-- i might want to change this later
-- vim.keymap.set("n", "<leader>r", function() require("snacks").picker.recent() end, { desc = "Recent files" })

function RunScript()
  local filetype = vim.bo.filetype
  local current_file = vim.fn.expand('%:p')  
  local current_dir = vim.fn.expand('%:p:h')   
  if filetype == 'python' then
    local lines = vim.fn.getline(1, 5)
    local env_name
    local use_uv = false
    local shebang
    for _, line in ipairs(lines) do
      if line:match("^#!") then
        shebang = line:match("^#!%s*(.+)")
        break 
      elseif line:match("#%s*uv") then
        use_uv = true
      elseif not env_name then
        env_name = line:match("#%s*env:%s*(%S+)")
      end
    end
    local python_cmd
    if shebang then
      python_cmd = shebang
    else
      -- Check for .venv first (higher priority)
      local venv_path = vim.fs.find('.venv', {
        upward = true,
        stop = vim.loop.os_homedir(),
        path = current_dir
      })[1]
      if venv_path then
        python_cmd = venv_path .. '/bin/python'
      elseif env_name then
        python_cmd = "/home/allan/miniconda3/envs/" .. env_name .. "/bin/python"
      else
        python_cmd = "/home/allan/miniconda3/bin/python"  
      end
    end
    vim.cmd('!' .. python_cmd .. ' ' .. vim.fn.shellescape(current_file))
  
  elseif filetype == 'javascript' then
    vim.cmd('!cd ' .. current_dir .. ' && node ' .. vim.fn.shellescape(current_file))
  
  elseif filetype == "tex" then
    vim.cmd('VimtexCompile')
    
  elseif filetype == 'sh' then
    vim.cmd('!chmod +x ' .. vim.fn.shellescape(current_file) .. ' && ' .. vim.fn.shellescape(current_file))

  elseif filetype == 'cpp' then
    local filename = vim.fn.expand('%:t')  
    local output_name = filename:match("(.+)%..+$")  
    vim.cmd('!cd ' .. current_dir .. ' && g++ ' .. filename .. ' -o ' .. output_name .. ' && ./' .. output_name)
    
  elseif filetype == "cuda" then 
    local filename = vim.fn.expand('%:t')
    local output_name = filename:match("(.+)%..+$")
    vim.cmd('!cd ' .. current_dir .. ' && nvcc ' .. filename .. ' -o ' .. output_name .. ' && ./' .. output_name)

  else
    print("Unsupported file type")
  end
end

vim.keymap.set('n', '<leader>m', ':lua RunScript()<CR>', { noremap = true, silent = true })
