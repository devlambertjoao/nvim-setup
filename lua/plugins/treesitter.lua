if os.getenv("NEOVIM_OS_RUNNING") == "WINDOWS" then
	return {}
end

return {
--	"nvim-treesitter/nvim-treesitter",
--	event = { "VeryLazy" },
--	config = function()
--		require("nvim-treesitter.configs").setup({
--			sync_install = false,
--			auto_install = true,
--			ignore_install = {},
--			indent = {
--				enable = true,
--			},
--			highlight = {
--				enable = true,
--				disable = function(_, buf)
--					local max_filesize = 512 * 1024 -- 512 KB
--					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
--					if ok and stats and stats.size > max_filesize then
--						return true
--					end
--				end,
--				additional_vim_regex_highlighting = false,
--			},
--		})
--	end,
}
