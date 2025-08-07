return {
    -- 🔖 AUTOTAG
    {
        "windwp/nvim-ts-autotag",
        event = "InsertEnter", -- optional: load only when editing
        dependencies = {
        "nvim-treesitter/nvim-treesitter"
        },
        config = function()
        require("nvim-ts-autotag").setup()
        end
    }
}
