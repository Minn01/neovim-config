return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#393939", bold = true })

            require("lualine").setup({
                options = {
                    theme = "auto", -- or "gruvbox", "tokyonight", etc.
                    component_separators = "|",
                    section_separators = "",
                    globalstatus = true,
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch", "diff", "diagnostics" },
                    lualine_c = { "filename" },
                    lualine_x = { "encoding", "fileformat", "filetype" },
                    lualine_y = { "progress" },
                    lualine_z = { "location" },
                },
            })
        end
    }
}
