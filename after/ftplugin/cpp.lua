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

Add_lsp_server('clangd', {
  cmd = {
    clangd_path,
  },
  filetypes = { "c", "cpp", "h", "hpp", "objc", "objcpp", "cuda", "proto" },
  root_dir = Get_root_dir()
})

Start_lsp()
