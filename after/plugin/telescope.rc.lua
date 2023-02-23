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

vim.api.nvim_command([[
  hi TelescopeNormal ctermbg=none guibg=none
  hi TelescopePromptNormal ctermbg=none guibg=none
]])
