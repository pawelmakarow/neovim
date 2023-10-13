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

    local remap = require("pawelmakarow.me.util").remap
    local bufopts = { silent = true, noremap = true }

    local on_attach = function(client, bufnr)
      remap("n", "gD", "vim.lsp.buf.declaration", bufopts, "Goto Declaration")
      remap("n", "gd", "vim.lsp.buf.definition", bufopts, "Go to definition")
      remap("n", "gi", "vim.lsp.buf.implementation", bufopts, "Go to implementation")
      remap("n", "K",  "vim.lsp.buf.hover", bufopts, "Hover text")
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
