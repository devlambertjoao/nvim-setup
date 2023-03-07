return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'neovim/nvim-lsp',
    'RishabhRD/popfix',
    'RishabhRD/nvim-lsputils',
  },
  event = { 'BufRead', 'InsertEnter' },
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
    local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

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

    NEOVIM_HOME = os.getenv("NEOVIM_HOME")
    NEOVIM_OS_RUNNING = os.getenv("NEOVIM_OS_RUNNING")

    local function get_root_dir(...)
      return nvim_lsp.util.root_pattern(...)
    end

    local default_root_dir = function()
      return vim.loop.cwd()
    end

    local servers_started = {}

    local function add_lsp_server(server_name, server_options)
      if servers_started[server_name] == nil then
        local default_server_options = {
          capabilities = capabilities,
          on_attach = on_attach,
          name = server_name,
        }

        default_server_options = vim.tbl_deep_extend("force", server_options, default_server_options)

        nvim_lsp[server_name].setup(default_server_options)

        vim.cmd [[LspStart]]
        servers_started[server_name] = true
      end
    end

    ------------------------------- SERVERS SETUP -------------------------------

    ------------------------------ lua_ls
    local lua_ls_path = NEOVIM_HOME .. "/lsp/luals"

    if NEOVIM_OS_RUNNING == "WINDOWS"
    then
      lua_ls_path = lua_ls_path .. "/windows/bin/lua-language-server.exe"
    end

    if NEOVIM_OS_RUNNING == "LINUX"
    then
      lua_ls_path = lua_ls_path .. "/linux-x64/bin/lua-language-server"
    end

    if NEOVIM_OS_RUNNING == "MACOS"
    then
      lua_ls_path = lua_ls_path .. "/macos-arm/bin/lua-language-server"
    end

    add_lsp_server('lua_ls', {
      cmd = { lua_ls_path },
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
    ------------------------------- lua_ls

    ------------------------------- solargraph
    local solargraph_path = NEOVIM_HOME .. "/lsp/solargraph"

    add_lsp_server('solargraph', {
      cmd = { solargraph_path .. "/bin/solargraph", "stdio" },
      root_dir = get_root_dir("Gemfile", ".git"),
      filetypes = {
        "ruby"
      },
      init_options = {
        formatting = true
      },
      settings = {
        solargraph = {
          diagnostics = true,
        }
      },
    })
    ------------------------------- solargraph


    ------------------------------- clangd
    local clangd_path = NEOVIM_HOME .. "/lsp/clangd"

    if NEOVIM_OS_RUNNING == "WINDOWS"
    then
      clangd_path = clangd_path .. "/windows/bin/clangd.exe"
    end

    if NEOVIM_OS_RUNNING == "LINUX"
    then
      clangd_path = clangd_path .. "/linux-x64/bin/clangd"
    end

    if NEOVIM_OS_RUNNING == "MACOS"
    then
      clangd_path = clangd_path .. "/macos-arm/bin/clangd"
    end

    add_lsp_server('clangd', {
      cmd = {
        clangd_path,
      },
      filetypes = { "c", "cpp", "h", "hpp", "objc", "objcpp", "cuda", "proto" },
      root_dir = default_root_dir
    })
    ------------------------------- clangd

    ------------------------------- rust_analyzer
    local rust_analyzer_path = NEOVIM_HOME .. "/lsp/rust-analyzer"

    if NEOVIM_OS_RUNNING == "WINDOWS"
    then
      rust_analyzer_path = rust_analyzer_path .. "/windows"
    end

    if NEOVIM_OS_RUNNING == "LINUX"
    then
      rust_analyzer_path = rust_analyzer_path .. "/linux-x64"
    end

    if NEOVIM_OS_RUNNING == "MACOS"
    then
      rust_analyzer_path = rust_analyzer_path .. "/macos-arm"
    end

    add_lsp_server('rust_analyzer', {
      cmd = { rust_analyzer_path },
      root_dir = get_root_dir("Cargo.toml", "rust-project.json"),
      filetypes = {
        "rust"
      },
      settings = {
        ["rust-analyzer"] = {}
      },
    })
    ------------------------------- rust_analyzer

    ------------------------------- jsonls
    local jsonls_path = NEOVIM_HOME .. "/lsp/vscode/node_modules/.bin/vscode-json-language-server"

    if NEOVIM_OS_RUNNING == "WINDOWS"
    then
      jsonls_path = jsonls_path .. ".cmd"
    end

    add_lsp_server('jsonls', {
      cmd = { jsonls_path, "--stdio" },
      init_options = {
        provideFormatter = true
      },
      filetypes = { "json", "jsonc" },
      single_file_support = true,
      root_dir = default_root_dir
    })
    ------------------------------- jsonls

    ------------------------------- jdtls
    local jdtls_path = NEOVIM_HOME .. "/lsp/jdtls"

    local jdtls_config = NEOVIM_HOME .. "/lsp/jdtls"

    if NEOVIM_OS_RUNNING == "WINDOWS"
    then
      jdtls_config = jdtls_config .. "/config_win"
    end

    if NEOVIM_OS_RUNNING == "LINUX"
    then
      jdtls_config = jdtls_config .. "/config_linux"
    end

    if NEOVIM_OS_RUNNING == "MACOS"
    then
      jdtls_config = jdtls_config .. "/config_macos"
    end

    add_lsp_server('jdtls', {
      cmd = {
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-javaagent:" .. jdtls_path .. "/lombok.jar",
        "-Xms1g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens",
        "java.base/java.util=ALL-UNNAMED",
        "--add-opens",
        "java.base/java.lang=ALL-UNNAMED",
        "-jar",
        vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar"),
        "-configuration",
        jdtls_config,
        "-data",
        NEOVIM_HOME .. "/.temp/java_workspace",
      },
      settings = {
        java = {
          eclipse = {
            downloadSources = true,
          },
          configuration = {
            updateBuildConfiguration = "interactive",
          },
          maven = {
            downloadSources = true,
          },
          implementationsCodeLens = {
            enabled = true,
          },
          referencesCodeLens = {
            enabled = true,
          },
          references = {
            includeDecompiledSources = true,
          },
          inlayHints = {
            parameterNames = {
              enabled = "all", -- literals, all, none
            },
          },
          format = {
            enabled = false,
          },
        },
        signatureHelp = { enabled = true },
      },
      single_file_support = true,
      root_dir = get_root_dir('pom.xml')
    })
    ------------------------------- jdtls


    ------------------------------- omnisharp
    local omnisharp_path = NEOVIM_HOME .. "/lsp/omnisharp"

    if NEOVIM_OS_RUNNING == "WINDOWS"
    then
      omnisharp_path = omnisharp_path .. "/windows-net6/OmniSharp.dll"
    end

    if NEOVIM_OS_RUNNING == "LINUX"
    then
      omnisharp_path = omnisharp_path .. "/linux-x64-net6/OmniSharp.dll"
    end

    if NEOVIM_OS_RUNNING == "MACOS"
    then
      omnisharp_path = omnisharp_path .. "/macos-arm-net6/OmniSharp.dll"
    end

    add_lsp_server('omnisharp', {
      cmd = {
        "dotnet",
        omnisharp_path,
        "--languageserver",
        "--hostPID",
        tostring(vim.fn.getpid())
      },
      filetypes = { "cs", },
      root_dir = get_root_dir("*.csproj", "*.sln"),
      analyze_open_documents_only = false,
      enable_editorconfig_support = true,
      enable_ms_build_load_projects_on_demand = false,
      enable_roslyn_analyzers = true,
      organize_imports_on_format = true,
      enable_import_completion = false,
      sdk_include_prereleases = true,
    })
    ------------------------------- omnisharp

    -- ------ LSP Servers
    -- ---- Custom Servers
    -- -- Angular
    -- local angular_language_server_path = NEOVIM_HOME .. "/lsp/angularls"

    -- local cmd = {
    --   "node",
    --   angular_language_server_path .. "/node_modules/@angular/language-server/index.js",
    --   "--stdio",
    --   "--tsProbeLocations",
    --   angular_language_server_path,
    --   "--ngProbeLocations",
    --   angular_language_server_path,
    -- }

    -- local angularls_options = {
    --   filetypes = { "typescript", "html" },
    --   root_dir = default_root_dir,
    --   cmd = cmd,
    --   on_new_config = function(new_config)
    --     new_config.cmd = cmd
    --   end,
    -- }

    -- -- HTML
    -- local html_language_server_path = NEOVIM_HOME .. "/lsp/vscode/node_modules/.bin/vscode-html-language-server"

    -- if NEOVIM_OS_RUNNING == "WINDOWS"
    -- then
    --   html_language_server_path = html_language_server_path .. ".cmd"
    -- end

    -- local html_options = {
    --   cmd = { html_language_server_path, "--stdio" },
    --   init_options = {
    --     configurationSection = { "html", "css", "javascript" },
    --     embeddedLanguages = {
    --       css = true,
    --       javascript = true
    --     },
    --     provideFormatter = true
    --   },
    --   single_file_support = true,
    --   root_dir = default_root_dir
    -- }

    -- -- VUELS
    -- local vuels_language_server_path = NEOVIM_HOME .. "/lsp/vuels/node_modules/.bin/vls"

    -- local vuels_options = {
    --   cmd = { vuels_language_server_path, "--stdio" },
    --   root_dir = default_root_dir
    -- }

    -- -- CSS
    -- local css_language_server_path = NEOVIM_HOME .. "/lsp/vscode/node_modules/.bin/vscode-css-language-server"

    -- if NEOVIM_OS_RUNNING == "WINDOWS"
    -- then
    --   css_language_server_path = css_language_server_path .. ".cmd"
    -- end

    -- local cssls_options = {
    --   cmd = { css_language_server_path, "--stdio" },
    --   init_options = {
    --     provideFormatter = true
    --   },
    --   filetypes = { "css", "scss", "less" },
    --   single_file_support = true,
    --   root_dir = default_root_dir
    -- }

    -- -- Eslint
    -- local eslint_language_server_path = NEOVIM_HOME .. "/lsp/vscode/node_modules/.bin/vscode-eslint-language-server"

    -- if NEOVIM_OS_RUNNING == "WINDOWS"
    -- then
    --   eslint_language_server_path = eslint_language_server_path .. ".cmd"
    -- end

    -- local eslint_options = {
    --   cmd = { eslint_language_server_path, "--stdio" },
    --   init_options = {
    --     provideFormatter = true
    --   },
    --   filetypes = {
    --     "javascript",
    --     "javascriptreact",
    --     "javascript.jsx",
    --     "typescript",
    --     "typescriptreact",
    --     "typescript.tsx",
    --     "vue",
    --     "svelte",
    --     "astro"
    --   },
    --   settings = {
    --     codeAction = {
    --       disableRuleComment = {
    --         enable = true,
    --         location = "separateLine"
    --       },
    --       showDocumentation = {
    --         enable = true
    --       }
    --     },
    --     codeActionOnSave = {
    --       enable = false,
    --       mode = "all"
    --     },
    --     experimental = {
    --       useFlatConfig = false
    --     },
    --     format = true,
    --     nodePath = "",
    --     onIgnoredFiles = "off",
    --     packageManager = "npm",
    --     problems = {
    --       shortenToSingleLine = false
    --     },
    --     quiet = false,
    --     rulesCustomizations = {},
    --     run = "onType",
    --     useESLintClass = false,
    --     validate = "on",
    --     workingDirectory = {
    --       mode = "location"
    --     }
    --   },
    --   single_file_support = true,
    --   root_dir = default_root_dir
    -- }

    -- -- Typescript
    -- local ts_language_server_path = NEOVIM_HOME .. "/lsp/typescript/node_modules/.bin/typescript-language-server"

    -- if NEOVIM_OS_RUNNING == "WINDOWS"
    -- then
    --   ts_language_server_path = ts_language_server_path .. ".cmd"
    -- end

    -- local tsserver_options = {
    --   cmd = { ts_language_server_path, "--stdio" },
    --   init_options = {
    --     provideFormatter = true
    --   },
    --   filetypes = {
    --     "javascript",
    --     "javascriptreact",
    --     "javascript.jsx",
    --     "typescript",
    --     "typescriptreact",
    --     "typescript.tsx"
    --   },
    --   single_file_support = true,
    --   root_dir = default_root_dir
    -- }

    -- -- Tailwind Css
    -- local tailwindcss_language_server_path = NEOVIM_HOME ..
    --     "/lsp/tailwindcss/node_modules/.bin/tailwindcss-language-server"

    -- local tailwindcss_options = {
    --   cmd = { tailwindcss_language_server_path, "--stdio" },
    --   init_options = {
    --     provideFormatter = true
    --   },
    --   filetypes = {
    --     "javascript",
    --     "javascriptreact",
    --     "typescript",
    --     "typescriptreact",
    --     "vue",
    --     "eruby",
    --     "erb",
    --     "html",
    --     "css",
    --     "scss",
    --     "less",
    --     "sass",
    --   },
    --   single_file_support = true,
    --   root_dir = default_root_dir
    -- }

    -- local lsp_server_list = {
    --   angularls = angularls_options, -- Angular
    --   cssls = cssls_options, -- CSS, SCSS, LESS
    --   -- dartls = {},
    --   eslint = eslint_options, -- Eslint
    --   html = html_options, -- Html
    --   tsserver = tsserver_options, -- Typescript
    --   tailwindcss = tailwindcss_options, -- Tailwind
    --   -- pyright = {}, -- Python
    --   -- sqlls = {}, -- SQL
    --   vuels = vuels_options, -- VueJs
    -- }

    -- for server_name, server_options in pairs(lsp_server_list) do
    --   local default_server_options = {
    --     capabilities = capabilities,
    --     on_attach = on_attach,
    --   }

    --   default_server_options = vim.tbl_deep_extend("force", server_options, default_server_options)

    --   nvim_lsp[server_name].setup(default_server_options)
    -- end
  end
}
