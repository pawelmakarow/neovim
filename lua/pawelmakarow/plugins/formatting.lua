return {
  "stevearc/conform.nvim",
  event = {"BufReadPre", "BufNewFile"},
  config = function ()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        xml = { "xmlformat" },
        markdown = { "prettier" },
        lua = { "stylua" },
      }
    })
    vim.keymap.set({"n", "v"}, "<leader>pp", function()
      conform.format({
        lst_fallback = true,
        async = false,
        timeout_ms = 500
      })
    end, {desc = "Format file or visually selected block"})
  end
}
