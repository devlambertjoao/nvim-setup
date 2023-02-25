local status, nvim_lsp = pcall(require, "lspconfig")

if not status then
  return
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local default_root_dir = function(_)
  return vim.loop.cwd()
end

local neovim_home = os.getenv("NEOVIM_HOME")
local neovim_os_running = os.getenv("NEOVIM_OS_RUNNING")

local on_attach = function(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
	      autocmd CursorHold,CursorHoldI * silent! lua vim.lsp.diagnostic.get_line_diagnostics()
	    ]],
      false
    )
  end
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

------ LSP Servers
---- Custom Servers
-- Angular
local angular_language_server_path = neovim_home .. "/lsp/angularls"

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
local html_language_server_path = neovim_home .. "/lsp/vscode/node_modules/.bin/vscode-html-language-server"

if neovim_os_running == "WINDOWS"
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

-- CSS
local css_language_server_path = neovim_home .. "/lsp/vscode/node_modules/.bin/vscode-css-language-server"

if neovim_os_running == "WINDOWS"
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
local eslint_language_server_path = neovim_home .. "/lsp/vscode/node_modules/.bin/vscode-eslint-language-server"

if neovim_os_running == "WINDOWS"
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

-- JSON
local json_language_server_path = neovim_home .. "/lsp/vscode/node_modules/.bin/vscode-json-language-server"

if neovim_os_running == "WINDOWS"
then
  json_language_server_path = json_language_server_path .. ".cmd"
end

local jsonls_options = {
  cmd = { json_language_server_path, "--stdio" },
  init_options = {
    provideFormatter = true
  },
  filetypes = { "json", "jsonc" },
  single_file_support = true,
  root_dir = default_root_dir
}

-- Typescript
local ts_language_server_path = neovim_home .. "/lsp/typescript/node_modules/.bin/typescript-language-server"

if neovim_os_running == "WINDOWS"
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

-- Lua
local lua_language_server_path = neovim_home .. "/lsp/luals"

if neovim_os_running == "WINDOWS"
then
  lua_language_server_path = lua_language_server_path .. "/windows/bin/lua-language-server.exe"
end

if neovim_os_running == "LINUX"
then
  lua_language_server_path = lua_language_server_path .. "/linux-x64/bin/lua-language-server"
end

if neovim_os_running == "MACOS"
then
  lua_language_server_path = lua_language_server_path .. "/macos-arm/bin/lua-language-server"
end

local lua_ls_options = {
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
        ignoreDir = {
          "/lsp"
        },
      },
    },
  },
}

-- Java
local java_language_server_path = neovim_home .. "/lsp/jdtls"

local java_lsp_config = neovim_home .. "/lsp/jdtls"

if neovim_os_running == "WINDOWS"
then
  java_lsp_config = java_lsp_config .. "/config_win"
end

if neovim_os_running == "LINUX"
then
  java_lsp_config = java_lsp_config .. "/config_linux"
end

if neovim_os_running == "MACOS"
then
  java_lsp_config = java_lsp_config .. "/config_macos"
end

local jdtls_options = {
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-javaagent:" .. java_language_server_path .. "/lombok.jar",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-jar",
    vim.fn.glob(java_language_server_path .. "/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar"),
    "-configuration",
    java_lsp_config,
    "-data",
    neovim_home .. "/.temp/java_workspace",
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
  root_dir = default_root_dir
}

-- Rust
local rust_language_server_path = neovim_home .. "/lsp/rust-analyzer"

if neovim_os_running == "WINDOWS"
then
  rust_language_server_path = rust_language_server_path .. "/windows"
end

if neovim_os_running == "LINUX"
then
  rust_language_server_path = rust_language_server_path .. "/linux-x64"
end

if neovim_os_running == "MACOS"
then
  rust_language_server_path = rust_language_server_path .. "/macos-arm"
end

local rust_analyzer_options = {
  cmd = { rust_language_server_path },
  root_dir = default_root_dir,
  filetypes = {
    "rust"
  },
  settings = {
    ["rust-analyzer"] = {}
  },
}

-- Ruby
local ruby_language_server_path = neovim_home .. "/lsp/solargraph"

local solargraph_options = {
  cmd = { ruby_language_server_path .. "/bin/solargraph", "stdio" },
  root_dir = default_root_dir,
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
}

vim.g.rspec_command = "!" .. ruby_language_server_path .. "/rspec --drb {spec}"

-- .NET
local dotnet_language_server_path = neovim_home .. "/lsp/omnisharp"

if neovim_os_running == "WINDOWS"
then
  dotnet_language_server_path = dotnet_language_server_path .. "/windows-net6/OmniSharp.dll"
end

if neovim_os_running == "LINUX"
then
  dotnet_language_server_path = dotnet_language_server_path .. "/linux-x64-net6/OmniSharp.dll"
end

if neovim_os_running == "MACOS"
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
local c_language_server_path = neovim_home .. "/lsp/clangd"

if neovim_os_running == "WINDOWS"
then
  c_language_server_path = c_language_server_path .. "/windows/bin/clangd.exe"
end

if neovim_os_running == "LINUX"
then
  c_language_server_path = c_language_server_path .. "/linux-x64/bin/clangd"
end

if neovim_os_running == "MACOS"
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
  jsonls = jsonls_options, -- JSON
  jdtls = jdtls_options, -- Java
  tsserver = tsserver_options, -- Typescript
  -- tailwindcss = {}, -- Tailwind
  lua_ls = lua_ls_options, -- Lua
  -- pyright = {}, -- Python
  solargraph = solargraph_options, -- Ruby
  rust_analyzer = rust_analyzer_options, -- Rust
  -- sqlls = {}, -- SQL
  -- vuels = {}, -- VueJs
}

for server_name, server_options in pairs(lsp_server_list) do
  local default_server_options = {
    capabilities = capabilities,
    on_attach = on_attach,
  }

  default_server_options = vim.tbl_deep_extend("force", server_options, default_server_options)

  nvim_lsp[server_name].setup(default_server_options)
end
