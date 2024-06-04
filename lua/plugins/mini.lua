return {
	"echasnovski/mini.nvim",
	event = { "VeryLazy" },
	config = function()
		require("mini.cursorword").setup()
		require("mini.pairs").setup()
		require("mini.splitjoin").setup()
		require("mini.indentscope").setup()
		require("mini.comment").setup({
			mappings = {
				comment = "gc",
				comment_line = "<leader>cl",
				textobject = "gc",
			},
		})
	end,
}
