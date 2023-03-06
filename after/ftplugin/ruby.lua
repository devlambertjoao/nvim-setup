local ruby_language_server_path = NEOVIM_HOME .. "/lsp/solargraph"

Add_lsp_server('solargraph', {
  cmd = { ruby_language_server_path .. "/bin/solargraph", "stdio" },
  root_dir = Get_root_dir("Gemfile", ".git"),
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
