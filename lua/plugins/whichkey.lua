return {
	"folke/which-key.nvim",
	keys = { "<leader>", "<C-w>" },
	cmd = "WhichKey",
	config = function()
		local whichkey = require("which-key")

		vim.o.timeout = true
		vim.o.timeoutlen = 1000

		whichkey.setup({
			icons = {
				breadcrumb = ">",
				separator = "|",
				group = "+",
			},
			window = {
				border = "none",
				position = "top",
				margin = { 2, 16, 2, 16 },
				padding = { 1, 1, 1, 1 },
				winbled = 80,
			},
			layout = {
				height = { min = 10, max = 60 },
				width = { min = 4, max = 80 },
				spacing = 0,
				align = "center",
			},
			disable = {
				filetypes = { "TelescopePrompt" },
			},
			triggers = { "<leader>" },
		})

		whichkey.register({
			f = {
				name = "File Navigation",
				o = { "<cmd>Oil<CR>", "Oil" },
				p = { "<cmd>Telescope find_files<CR>", "Find Files" },
				f = { "<cmd>Telescope live_grep<CR>", "Grep Files" },
			},
			c = {
				name = "Code Actions",
				r = { "Rename" },
				a = { "Code Actions" },
				f = { "Format" },
			},
			d = {
				name = "Diagnostics",
				a = { "<cmd>Telescope diagnostics<CR>", "All Workspace Diagnostics" },
				d = { vim.diagnostic.open_float, "Line Diagnostics" },
				p = { vim.diagnostic.goto_prev, "Previous Occurence" },
				n = { vim.diagnostic.goto_next, "Next Occurence" },
				l = { vim.diagnostic.setloclist, "List File Diagnostics" },
			},
			g = {
				name = "Code Navigation",
				D = { "Declaration" },
				d = { "Definition" },
				i = { "Implementation" },
				r = { "References" },
				k = { "Docs" },
				K = { "Signature" },
				R = { "Rename" },
			},
			G = {
				name = "Git",
				s = { "<cmd>Telescope git_status<CR>", "Git Status" },
				c = { "<cmd>Telescope git_commits<CR>", "Git Commits" },
				b = { "<cmd>Telescope git_branches<CR>", "Git Branches" },
			},
		}, { prefix = "<leader>" })
	end,
}
