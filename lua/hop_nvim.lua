-- In your plugins list (lsp.lua)
-- Using hop.nvim instead of flash.nvim (more reliable)
return {
    "smoka7/hop.nvim",
    version = "*",
    event = "VeryLazy",
    config = function()
        require("hop").setup()
    end,
}
