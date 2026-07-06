return {
	-- Mason core plugin
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = true,
		opts = {},
	},
	-- Mason-LSPConfig bridge
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				automatic_installation = true,
			})
		end,
	},
	require("roslyn_setup"),
	-- Core LSP config
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			-- Check if we have the new API (Neovim 0.11+)
			local has_new_api = vim.lsp.config ~= nil

			if has_new_api then
				-- Use new vim.lsp.config API
				local util = require("lspconfig.util")
				local capabilities = require("cmp_nvim_lsp").default_capabilities()

				local on_attach = function(client, bufnr)
					require("lsp_mappings").lsp_keymaps(bufnr)
				end

				local servers = {
					"html",
					"cssls",
					"lua_ls",
					"pyright",
					"jdtls",
					"rust_analyzer",
					"clangd",
					"gopls",
				}

				for _, server in ipairs(servers) do
					local opts = {
						capabilities = capabilities,
						on_attach = on_attach,
					}
					require("custom_lsp_configs").CustomConfig(server, opts)
					local root = require("lsp_root_dir_detect").Detect_root(server, util)
					if root then
						opts.root_dir = root
					end

					-- Use new API
					vim.lsp.config(server, opts)
				end
			else
				-- Fallback to old lspconfig API for older Neovim versions
				local lspconfig = require("lspconfig")

				-- 1. Find the "if has_new_api" section and add this at the top of that block:
				if has_new_api then
					vim.diagnostic.config({
						signs = {
							text = {
								[vim.diagnostic.severity.ERROR] = " ",
								[vim.diagnostic.severity.WARN] = " ",
								[vim.diagnostic.severity.HINT] = "󰌵 ",
								[vim.diagnostic.severity.INFO] = " ",
							},
						},
					})
				-- 2. Find the "else" (Fallback) section and replace your current diagnostic block:
				else
					vim.diagnostic.config({
						signs = {
							text = {
								[vim.diagnostic.severity.ERROR] = " ",
								[vim.diagnostic.severity.WARN] = " ",
								[vim.diagnostic.severity.INFO] = " ",
								[vim.diagnostic.severity.HINT] = "󰌵 ",
							},
						},
					})
					-- ... rest of your fallback code ...
				end

				local util = require("lspconfig.util")
				local capabilities = vim.lsp.protocol.make_client_capabilities()

				pcall(function()
					capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
				end)

				local on_attach = function(client, bufnr)
					require("lsp_mappings").lsp_keymaps(bufnr)
				end

				local servers = {
					"html",
					"cssls",
					"lua_ls",
					"pyright",
					"ts_ls",
					"jdtls",
					"rust_analyzer",
					"clangd",
					"gopls",
				}

				for _, server in ipairs(servers) do
					local opts = {
						capabilities = capabilities,
						on_attach = on_attach,
					}
					require("custom_lsp_configs").CustomConfig(server, opts)
					local root = require("lsp_root_dir_detect").Detect_root(server, util)
					if root then
						opts.root_dir = root
					end

					lspconfig[server].setup(opts)
				end
			end
		end,
	},
	require("completion_lsp"),
}
