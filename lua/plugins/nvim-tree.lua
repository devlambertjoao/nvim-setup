return {
	"nvim-tree/nvim-tree.lua",
	cmd = { "NvimTreeFindFileToggle", "NvimTreeOpen" },
	config = function()
		require("nvim-tree").setup({
			sort_by = "case_sensitive",
			view = {
				adaptive_size = true,
			},
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
			renderer = {
				group_empty = false,
				icons = {
					show = {
						file = false,
						folder = true,
						folder_arrow = false,
						git = true,
						modified = true,
					},
					glyphs = {
						git = {
							unstaged = "~",
							staged = "S",
							unmerged = "[M]",
							renamed = "R",
							untracked = "+",
							deleted = "x",
							ignored = "i",
						},
						folder = {
							default = ">",
							open = "v",
							empty = "[]",
							empty_open = "v",
						},
						modified = "*",
						default = "",
					},
				},
				indent_width = 2,
				indent_markers = {
					enable = true,
					inline_arrows = false,
					icons = {
						corner = "└",
						edge = "│",
						item = "│",
						bottom = "─",
						none = " ",
					},
				},
			},
			filters = {
				dotfiles = false,
			},
		})
	end,
}
