return {
  "neovim/nvim-lspconfig",
  event = {"BufReadPre", "BufNewFile"},
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local keymap = vim.keymap

    local on_attach = function(client, bufnr)
      keymap.set("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
      keymap.set("n", "gd", vim.lsp.buf.definition, "Go to definition")
      keymap.set("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
      keymap.set("n", "K",  vim.lsp.buf.hover, "Hover text")
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- list of servers configurations
    -- Lua
    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = {"vim"},
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            }
          },
        }
      }
    })
    -- Markdown
    lspconfig['marksman'].setup({
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "bib", "markdown", "org", "plaintex", "rst", "rnoweb", "tex", "pandoc" },
      settings = {
        ltex = {
          language = "en-CA",
        }
      }
    })

  end,
}
