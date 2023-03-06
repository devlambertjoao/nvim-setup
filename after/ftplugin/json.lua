local json_language_server_path = NEOVIM_HOME .. "/lsp/vscode/node_modules/.bin/vscode-json-language-server"

if NEOVIM_OS_RUNNING == "WINDOWS"
then
  json_language_server_path = json_language_server_path .. ".cmd"
end

Add_lsp_server('jsonls', {
  cmd = { json_language_server_path, "--stdio" },
  init_options = {
    provideFormatter = true
  },
  filetypes = { "json", "jsonc" },
  single_file_support = true,
  root_dir = Get_default_root_dir()
})

Start_lsp()
