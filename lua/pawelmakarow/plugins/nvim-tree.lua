return  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}

      -- set keymaps
      local keymap = vim.keymap
      keymap.set("n", "<A-1>", "<cmd>NvimTreeFindFileToggle<CR>", {desc = "Toggle file explorer"})
    end,
  }
