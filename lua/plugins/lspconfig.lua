return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"neovim/nvim-lsp",
			"hrsh7th/nvim-cmp",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"RishabhRD/popfix",
			"RishabhRD/nvim-lsputils",
		},
		event = { "VeryLazy" },
		config = function()
			-- Virtual Text Config
			vim.diagnostic.config({
				virtual_text = {
					prefix = "#",
				},
				-- virtual_text = false,
				severity_sort = true,
				update_in_insert = true,
				float = {
					source = "always",
				},
			})

			-- Signs Config
			local signs = { Error = "e", Warn = "w", Hint = "h", Info = "i" }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end

			-- Mason Config
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "+",
						package_pending = "~",
						package_uninstalled = "-",
					},
				},
			})

			local mason_lspconfig = require("mason-lspconfig")
			mason_lspconfig.setup({
				ensure_installed = {
					"lua_ls",
					"solargraph",
          "htmx",
					-- "stimulus_ls",
					-- "rust_analyzer",
					-- "clangd",
					"jsonls",
					-- "jdtls",
					-- "omnisharp",
					"angularls",
					"html",
					-- "vuels",
					-- "cssls",
					"tsserver",
					"tailwindcss",
				},
			})

			local lspconfig = require("lspconfig")

			-- Setup cmp integration
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local default_server_options = {
				capabilities = capabilities,
			}

			-- Setup All Avaible Servers
			mason_lspconfig.setup_handlers({
				function(server_name)
					lspconfig[server_name].setup(default_server_options)
				end,
				-- Custom Servers Configuration
				["lua_ls"] = function()
					lspconfig["lua_ls"].setup(vim.tbl_deep_extend("force", {
						settings = {
							Lua = {
								runtime = {
									version = "LuaJIT",
								},
								diagnostics = {
									globals = { "vim" },
								},
								workspace = {
									library = vim.api.nvim_get_runtime_file("", true),
									checkThirdParty = false,
								},
							},
						},
					}, default_server_options))
				end,
				["solargraph"] = function()
					lspconfig["solargraph"].setup(vim.tbl_deep_extend("force", {
						settings = {
							diagnostics = false,
						},
					}, default_server_options))
				end,
			})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			-- "hrsh7th/cmp-vsnip",
			-- "hrsh7th/vim-vsnip",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		event = { "VeryLazy" },
		config = function()
			local cmp = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						-- vim.fn["vsnip#anonymous"](args.body)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
					["<C-e>"] = cmp.mapping.close(),
					["<C-c>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					-- { name = "vsnip" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
				}),
				window = {
					completion = {
						-- winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
						padding = 3,
					},
					documentation = {
						-- winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
						padding = 3,
					},
				},
			})

			cmp.setup.cmdline("/", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})

			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
}
