return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            indent = {
                char = "│",
                highlight = "IblIndent", -- Tells the plugin which group to use
            },
            scope = {
                enabled = true,
                highlight = "IblScope", -- You can color the active scope differently
            },
        },
        config = function(_, opts)
            -- Set the actual color here
            vim.api.nvim_set_hl(0, "IblIndent", { fg = "#444444" }) -- A soft grey
            vim.api.nvim_set_hl(0, "IblScope", { fg = "#FFFFFF" })  -- Pure white for active scope
            require("ibl").setup(opts)
        end
    }
}
