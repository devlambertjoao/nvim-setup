local rust_language_server_path = NEOVIM_HOME .. "/lsp/rust-analyzer"

if NEOVIM_OS_RUNNING == "WINDOWS"
then
  rust_language_server_path = rust_language_server_path .. "/windows"
end

if NEOVIM_OS_RUNNING == "LINUX"
then
  rust_language_server_path = rust_language_server_path .. "/linux-x64"
end

if NEOVIM_OS_RUNNING == "MACOS"
then
  rust_language_server_path = rust_language_server_path .. "/macos-arm"
end

Add_lsp_server('rust_analyzer', {
  cmd = { rust_language_server_path },
  root_dir = Get_root_dir("Cargo.toml", "rust-project.json"),
  filetypes = {
    "rust"
  },
  settings = {
    ["rust-analyzer"] = {}
  },
})

Start_lsp()
