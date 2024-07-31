return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		event = { "VeryLazy" },
		config = function()
			local telescope = require("telescope")

			telescope.setup({
				defaults = {
					file_ignore_patterns = {
						"node_modules",
						"target",
						"bin",
						"obj",
						"lsp/",
						"lsp\\",
						"lazy-lock.json",
					},
				},
			})

			vim.keymap.set("n", "<leader>fp", "<cmd>Telescope find_files<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>ff", "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true })
		end,
	},
}
