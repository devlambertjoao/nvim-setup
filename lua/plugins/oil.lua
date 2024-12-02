return {
  'stevearc/oil.nvim',
  opts = {},
  cmd = 'Oil',
  config = function ()
    require('oil').setup({})

		vim.keymap.set("n", "<leader>fo", "<cmd>Oil<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>fO", "<cmd>Oil .<CR>", { noremap = true, silent = true })
  end
}
