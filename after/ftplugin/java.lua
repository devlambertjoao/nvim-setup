local java_language_server_path = NEOVIM_HOME .. "/lsp/jdtls"

local java_lsp_config = NEOVIM_HOME .. "/lsp/jdtls"

if NEOVIM_OS_RUNNING == "WINDOWS"
then
  java_lsp_config = java_lsp_config .. "/config_win"
end

if NEOVIM_OS_RUNNING == "LINUX"
then
  java_lsp_config = java_lsp_config .. "/config_linux"
end

if NEOVIM_OS_RUNNING == "MACOS"
then
  java_lsp_config = java_lsp_config .. "/config_macos"
end

Add_lsp_server('jdtls', {
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
  root_dir = Get_root_dir('pom.xml')
})

Start_lsp()
