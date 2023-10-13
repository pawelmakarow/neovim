return {
  "nvim-telescope/telescope.nvim", branch = '0.1.x',
  dependencies = {
    "nvim-telescope/telescope-dap.nvim",
    "nvim-lua/plenary.nvim" ,
    "nvim-telescope/telescope-ui-select.nvim"
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "truncate " },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        }
      }
    })
    telescope.load_extension("ui-select")
    telescope.load_extension("dap")

    local keymap = vim.keymap
    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", {desc = "Find files in CWD" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", {desc = "Find recent files in CWD" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", {desc = "Find string in CWD" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", {desc = "Find string under cursor in CWD" })
  end,
}
