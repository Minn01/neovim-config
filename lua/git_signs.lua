return {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("gitsigns").setup({
            -- Use a thin bar, VS Code–style
            signs = {
                add          = { text = "│" },
                change       = { text = "│" },
                delete       = { text = "│" },
                topdelete    = { text = "│" },
                changedelete = { text = "│" },
            },

            signcolumn = true,
            numhl = false,
            linehl = false,
            current_line_blame = false,
        })

        -- GitSigns colors (survive colorscheme changes)
        vim.api.nvim_create_autocmd("ColorScheme", {
            callback = function()
                vim.api.nvim_set_hl(0, "GitSignsAdd",    { fg = "#4CAF50" })
                vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#2196F3" })
                vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#F44336" })
            end,
        })
    end,
}
