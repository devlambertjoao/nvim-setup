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

Add_lsp_server('omnisharp', {
  cmd = {
    "dotnet",
    dotnet_language_server_path,
    "--languageserver",
    "--hostPID",
    tostring(vim.fn.getpid())
  },
  filetypes = { "cs", },
  root_dir = Get_root_dir("*.csproj", "*.sln"),
  analyze_open_documents_only = false,
  enable_editorconfig_support = true,
  enable_ms_build_load_projects_on_demand = false,
  enable_roslyn_analyzers = true,
  organize_imports_on_format = true,
  enable_import_completion = false,
  sdk_include_prereleases = true,
})

Start_lsp()
