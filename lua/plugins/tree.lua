return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- optional, for file icons
  },
  config = function()
    require("nvim-tree").setup {
      sort_by = "case_sensitive",
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false,
        git_ignored = false,   -- 👈 show files ignored by git
        custom = {},           -- 👈 clear default hide patterns
      },
      git = {
        enable = true,         -- can be true or false, doesn't affect visibility if git_ignored=false
        ignore = false,
      },
    }

    -- Toggle file tree
    vim.keymap.set("n", "<leader>m", ":NvimTreeToggle<CR>", { silent = true })
  end,
}
