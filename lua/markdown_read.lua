return {
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        ft = { "markdown" },
        config = function()
            vim.g.mkdp_auto_start = 0 -- Set to 1 to auto-preview when opening MD
            vim.g.mkdp_browser = "" -- Leave blank to use default browser
        end,
    }
}
