local nvim_lsp = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

NEOVIM_HOME = os.getenv("NEOVIM_HOME")
NEOVIM_OS_RUNNING = os.getenv("NEOVIM_OS_RUNNING")

function Get_root_dir(...)
  return nvim_lsp.util.root_pattern(...)
end

function Get_default_root_dir(_)
  return vim.loop.cwd()
end

function Start_lsp()
  vim.cmd [[LspStart]]
end

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

function Add_lsp_server(server_name, server_options)
  local default_server_options = {
    capabilities = capabilities,
    on_attach = on_attach,
  }

  default_server_options = vim.tbl_deep_extend("force", server_options, default_server_options)

  nvim_lsp[server_name].setup(default_server_options)
end

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'neovim/nvim-lsp',
    'RishabhRD/popfix',
    'RishabhRD/nvim-lsputils',
  },
  event = { 'InsertEnter' },
  config = function()
    local default_root_dir = function(_)
      return vim.loop.cwd()
    end

    -- Diagnostic Setup
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


    -- Lua
    local lua_language_server_path = NEOVIM_HOME .. "/lsp/luals"
    
    if NEOVIM_OS_RUNNING == "WINDOWS"
    then
      lua_language_server_path = lua_language_server_path .. "/windows/bin/lua-language-server.exe"
    end
    
    if NEOVIM_OS_RUNNING == "LINUX"
    then
      lua_language_server_path = lua_language_server_path .. "/linux-x64/bin/lua-language-server"
    end
    
    if NEOVIM_OS_RUNNING == "MACOS"
    then
      lua_language_server_path = lua_language_server_path .. "/macos-arm/bin/lua-language-server"
    end
    
    Add_lsp_server('lua_ls', {
      cmd = { lua_language_server_path },
      root_dir = default_root_dir,
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT'
          },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
            ignoreDir = {
              "/lsp"
            },
          },
        },
      },
    })


    ------ LSP Servers
    ---- Custom Servers
    -- Angular
    local angular_language_server_path = NEOVIM_HOME .. "/lsp/angularls"

    local cmd = {
      "node",
      angular_language_server_path .. "/node_modules/@angular/language-server/index.js",
      "--stdio",
      "--tsProbeLocations",
      angular_language_server_path,
      "--ngProbeLocations",
      angular_language_server_path,
    }

    local angularls_options = {
      filetypes = { "typescript", "html" },
      root_dir = default_root_dir,
      cmd = cmd,
      on_new_config = function(new_config)
        new_config.cmd = cmd
      end,
    }

    -- HTML
    local html_language_server_path = NEOVIM_HOME .. "/lsp/vscode/node_modules/.bin/vscode-html-language-server"

    if NEOVIM_OS_RUNNING == "WINDOWS"
    then
      html_language_server_path = html_language_server_path .. ".cmd"
    end

    local html_options = {
      cmd = { html_language_server_path, "--stdio" },
      init_options = {
        configurationSection = { "html", "css", "javascript" },
        embeddedLanguages = {
          css = true,
          javascript = true
        },
        provideFormatter = true
      },
      single_file_support = true,
      root_dir = default_root_dir
    }

    -- VUELS
    local vuels_language_server_path = NEOVIM_HOME .. "/lsp/vuels/node_modules/.bin/vls"

    local vuels_options = {
      cmd = { vuels_language_server_path, "--stdio" },
      root_dir = default_root_dir
    }

    -- CSS
    local css_language_server_path = NEOVIM_HOME .. "/lsp/vscode/node_modules/.bin/vscode-css-language-server"

    if NEOVIM_OS_RUNNING == "WINDOWS"
    then
      css_language_server_path = css_language_server_path .. ".cmd"
    end

    local cssls_options = {
      cmd = { css_language_server_path, "--stdio" },
      init_options = {
        provideFormatter = true
      },
      filetypes = { "css", "scss", "less" },
      single_file_support = true,
      root_dir = default_root_dir
    }

    -- Eslint
    local eslint_language_server_path = NEOVIM_HOME .. "/lsp/vscode/node_modules/.bin/vscode-eslint-language-server"

    if NEOVIM_OS_RUNNING == "WINDOWS"
    then
      eslint_language_server_path = eslint_language_server_path .. ".cmd"
    end

    local eslint_options = {
      cmd = { eslint_language_server_path, "--stdio" },
      init_options = {
        provideFormatter = true
      },
      filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
        "vue",
        "svelte",
        "astro"
      },
      settings = {
        codeAction = {
          disableRuleComment = {
            enable = true,
            location = "separateLine"
          },
          showDocumentation = {
            enable = true
          }
        },
        codeActionOnSave = {
          enable = false,
          mode = "all"
        },
        experimental = {
          useFlatConfig = false
        },
        format = true,
        nodePath = "",
        onIgnoredFiles = "off",
        packageManager = "npm",
        problems = {
          shortenToSingleLine = false
        },
        quiet = false,
        rulesCustomizations = {},
        run = "onType",
        useESLintClass = false,
        validate = "on",
        workingDirectory = {
          mode = "location"
        }
      },
      single_file_support = true,
      root_dir = default_root_dir
    }

    -- Typescript
    local ts_language_server_path = NEOVIM_HOME .. "/lsp/typescript/node_modules/.bin/typescript-language-server"

    if NEOVIM_OS_RUNNING == "WINDOWS"
    then
      ts_language_server_path = ts_language_server_path .. ".cmd"
    end

    local tsserver_options = {
      cmd = { ts_language_server_path, "--stdio" },
      init_options = {
        provideFormatter = true
      },
      filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx"
      },
      single_file_support = true,
      root_dir = default_root_dir
    }

    -- Tailwind Css
    local tailwindcss_language_server_path = NEOVIM_HOME ..
        "/lsp/tailwindcss/node_modules/.bin/tailwindcss-language-server"

    local tailwindcss_options = {
      cmd = { tailwindcss_language_server_path, "--stdio" },
      init_options = {
        provideFormatter = true
      },
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "eruby",
        "erb",
        "html",
        "css",
        "scss",
        "less",
        "sass",
      },
      single_file_support = true,
      root_dir = default_root_dir
    }

    -- Lua
    

    -- Rust
    

    -- .NET
    local dotnet_language_server_path = NEOVIM_HOME .. "/lsp/omnisharp"

    if NEOVIM_OS_RUNNING == "WINDOWS"
    then
      dotnet_language_server_path = dotnet_language_server_path .. "/windows-net6/OmniSharp.dll"
    end

    if NEOVIM_OS_RUNNING == "LINUX"
    then
      dotnet_language_server_path = dotnet_language_server_path .. "/linux-x64-net6/OmniSharp.dll"
    end

    if NEOVIM_OS_RUNNING == "MACOS"
    then
      dotnet_language_server_path = dotnet_language_server_path .. "/macos-arm-net6/OmniSharp.dll"
    end

    local omnisharp_options = {
      cmd = {
        "dotnet",
        dotnet_language_server_path,
        "--languageserver",
        "--hostPID",
        tostring(vim.fn.getpid())
      },
      filetypes = { "cs", },
      root_dir = default_root_dir,
      analyze_open_documents_only = false,
      enable_editorconfig_support = true,
      enable_ms_build_load_projects_on_demand = false,
      enable_roslyn_analyzers = true,
      organize_imports_on_format = true,
      enable_import_completion = false,
      sdk_include_prereleases = true,
    }

    -- C and C++
    local c_language_server_path = NEOVIM_HOME .. "/lsp/clangd"

    if NEOVIM_OS_RUNNING == "WINDOWS"
    then
      c_language_server_path = c_language_server_path .. "/windows/bin/clangd.exe"
    end

    if NEOVIM_OS_RUNNING == "LINUX"
    then
      c_language_server_path = c_language_server_path .. "/linux-x64/bin/clangd"
    end

    if NEOVIM_OS_RUNNING == "MACOS"
    then
      c_language_server_path = c_language_server_path .. "/macos-arm/clangd"
    end

    local clangd_options = {
      cmd = {
        c_language_server_path,
      },
      filetypes = { "c", "cpp", "h", "hpp", "objc", "objcpp", "cuda", "proto" },
      root_dir = default_root_dir
    }

    local lsp_server_list = {
      angularls = angularls_options, -- Angular
      clangd = clangd_options, -- C and C++
      omnisharp = omnisharp_options, -- C#
      cssls = cssls_options, -- CSS, SCSS, LESS
      -- dartls = {},
      eslint = eslint_options, -- Eslint
      html = html_options, -- Html
      tsserver = tsserver_options, -- Typescript
      tailwindcss = tailwindcss_options, -- Tailwind
      -- pyright = {}, -- Python
      -- sqlls = {}, -- SQL
      vuels = vuels_options, -- VueJs
    }

    for server_name, server_options in pairs(lsp_server_list) do
      local default_server_options = {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      default_server_options = vim.tbl_deep_extend("force", server_options, default_server_options)

      nvim_lsp[server_name].setup(default_server_options)
    end
  end
}
