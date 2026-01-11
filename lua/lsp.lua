return {
    -- 1. Mason core plugin
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = true,
    },

    -- 2. Mason-LSPConfig bridge (no automatic_enable!)
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "html",
                    "cssls",
                    "lua_ls",
                    "pyright",
                    "ts_ls",
                    "jdtls",
                    "rust_analyzer",
                    "clangd",
                    "omnisharp"
                },
                -- Do not rely on automatic_enable (removed upstream)
                automatic_installation = false,
                automatic_enable = false
            })
        end,
    },

    -- 3. Core LSP config
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")

            -- diagnostic signs
            vim.diagnostic.config({
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = " ",
                        [vim.diagnostic.severity.WARN]  = " ",
                        [vim.diagnostic.severity.INFO]  = " ",
                        [vim.diagnostic.severity.HINT]  = " ",
                    },
                },
            })

            local util = require("lspconfig.util")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local on_attach = function(_, bufnr)
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
                "omnisharp"
            }

            for _, server in ipairs(servers) do
                local opts = {
                    capabilities = capabilities,
                    on_attach = on_attach,
                }

                require("custom_lsp_configs").CustomConfig(server, opts)

                -- Add root_dir detection if needed
                local root = require("lsp_root_dir_detect").Detect_root(server, util)
                if root then opts.root_dir = root end

                lspconfig[server].setup(opts)
            end
        end,
    },

    -- 4. Your LSP completion engine setup
    require("completion_lsp"),
}
