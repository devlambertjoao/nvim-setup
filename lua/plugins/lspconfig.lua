return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'neovim/nvim-lsp',
    'hrsh7th/nvim-cmp',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'RishabhRD/popfix',
    'RishabhRD/nvim-lsputils',
  },
  event = { 'BufRead' },
  config = function()
    vim.diagnostic.config({
      virtual_text = {
        prefix = "#",
      },
      severity_sort = true,
      update_in_insert = true,
      float = {
        source = "always",
      },
    })

    local signs = { Error = "e", Warn = "w", Hint = "h", Info = "i" }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    local nvim_lsp = require("lspconfig")

    local on_attach = function(_, bufnr)
      local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
      end

      buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

      vim.lsp.handlers['textDocument/codeAction'] = require 'lsputil.codeAction'.code_action_handler
      vim.lsp.handlers['textDocument/references'] = require 'lsputil.locations'.references_handler
      vim.lsp.handlers['textDocument/definition'] = require 'lsputil.locations'.definition_handler
      vim.lsp.handlers['textDocument/declaration'] = require 'lsputil.locations'.declaration_handler
      vim.lsp.handlers['textDocument/typeDefinition'] = require 'lsputil.locations'.typeDefinition_handler
      vim.lsp.handlers['textDocument/implementation'] = require 'lsputil.locations'.implementation_handler
      vim.lsp.handlers['textDocument/documentSymbol'] = require 'lsputil.symbols'.document_handler
      vim.lsp.handlers['workspace/symbol'] = require 'lsputil.symbols'.workspace_handler
    end

    local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

    require("mason").setup({
      ui = {
        icons = {
          package_installed = "+",
          package_pending = "~",
          package_uninstalled = "-"
        }
      }
    })

    local mason_lspconfig = require("mason-lspconfig")
    mason_lspconfig.setup({
      ensure_installed = {
        "lua_ls",
        "solargraph",
        "rust_analyzer",
        "clangd",
        "jsonls",
        "jdtls",
        "omnisharp",
        "angularls",
        "html",
        "vuels",
        "cssls",
        "tsserver",
        "tailwindcss"
      },
    })

    local default_server_options = {
      on_attach = on_attach,
      capabilities = capabilities
    }

    mason_lspconfig.setup_handlers({
      function(server_name)
        nvim_lsp[server_name].setup(default_server_options)
      end,
      ["lua_ls"] = function()
        nvim_lsp["lua_ls"].setup(vim.tbl_deep_extend("force", {
          settings = {
            Lua = {
              runtime = {
                version = "LuaJIT"
              },
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
              },
            }
          }
        }, default_server_options))
      end
    })
  end
}
