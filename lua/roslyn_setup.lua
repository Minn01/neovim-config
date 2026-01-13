-- roslyn is for .NET C# development
return {
    {
        "seblyng/roslyn.nvim",
        ft = "cs",
        config = function()
            -- Grab your existing capabilities (for autocompletion)
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Grab your existing keymaps
            local on_attach = function(_, bufnr)
                require("lsp_mappings").lsp_keymaps(bufnr)
            end

            --  Run the special Roslyn setup
            require("roslyn").setup({
                config = {
                    on_attach = on_attach,
                    capabilities = capabilities,
                    -- This ensures it finds your .sln or .csproj file
                    root_dir = require("lspconfig.util").root_pattern("*.sln", "*.csproj"),
                    settings = {
                        ["csharp|background_analysis"] = {
                            dotnet_analyzer_diagnostics_scope = "fullSolution",
                            dotnet_show_analyzer_diagnostics_for_unused_code = true,
                        },
                    },
                },
                -- Note: Mason installs the binary here by default
                exe = "Microsoft.CodeAnalysis.LanguageServer",
            })
        end
    }
}
