return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"neovim/nvim-lsp",
			"hrsh7th/nvim-cmp",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"nvimtools/none-ls.nvim",
			"jay-babu/mason-null-ls.nvim",
		},
		event = { "VeryLazy" },
		config = function()
			-- Virtual Text Config
			vim.diagnostic.config({
				virtual_text = {
					prefix = "●",
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

			-- Formatting with none-ls
			local lsp_formatting = function(bufnr)
				vim.lsp.buf.format({
					filter = function(client)
						return client.name == "null-ls"
					end,
					bufnr = bufnr,
				})
			end

			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

			local on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							lsp_formatting(bufnr)
						end,
					})
				end
			end

			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					-- Lua
					null_ls.builtins.formatting.stylua,
					-- Ruby
					null_ls.builtins.formatting.rubocop,
					-- JS
					null_ls.builtins.formatting.prettierd,
				},
				on_attach = on_attach,
			})

			require("mason-null-ls").setup({
				automatic_installation = false,
				ensure_installed = {
					"stylua",
					"rubocop",
					"prettierd",
				},
			})

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
					"rust_analyzer",
					"clangd",
					"jsonls",
					"html",
					"tsserver",
					"tailwindcss",
				},
			})

			-- Setup cmp integration
			local default_capabilities = require("cmp_nvim_lsp").default_capabilities()

			local default_server_options = {
				capabilities = default_capabilities,
				on_attach = on_attach,
			}

			local lspconfig = require("lspconfig")

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
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
		},
		event = { "VeryLazy" },
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				snippet = {
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body)
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
					{ name = "vsnip" },
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
