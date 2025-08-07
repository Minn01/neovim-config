return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter", -- lazy-load when you enter insert mode
        config = function()
            require("nvim-autopairs").setup()
        end,
    }
}
