local status, telescope = pcall(require, "telescope")
if not status then
	return
end

telescope.setup({
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "target",
      "bin",
      "obj",
      "packer_compiled.lua",
      "lsp/",
      "lsp\\",
    }
  },
  pickers = {
    find_files = {
      theme = "dropdown"
    }
  }
})

