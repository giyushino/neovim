return {
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require('toggleterm').setup{
        size = 20,
        open_mapping = [[<leader>;]],
        direction = "float",
        shade_terminals = false, -- Disable shading for true transparency
        start_in_insert = true,
        persist_size = true,
        float_opts = {
          border = "rounded", -- Rounded corners
          winblend = 0, -- Transparency (0 = opaque, 100 = fully transparent)
        },
      }

      local function get_conda_env()
        local first_line = vim.fn.getline(1)
        local env = first_line:match("#conda_env:%s*(%S+)")
        return env
      end

      -- Open terminal in the current file's directory dynamically
      vim.keymap.set("n", "<leader>;", function()
        local file_dir = vim.fn.expand("%:p:h") -- Get current file's directory
        local conda_env = get_conda_env()
        local cmd = conda_env and ("conda activate " .. conda_env .. " && cmd.exe") or "cmd.exe"

        require("toggleterm.terminal").Terminal
          :new({ dir = file_dir, direction = "float", cmd = cmd })
          :toggle()
      end, { noremap = true, silent = true })
    end,
  },
}
