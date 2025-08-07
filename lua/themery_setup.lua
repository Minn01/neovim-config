return {
    {
        "zaldih/themery.nvim",
        lazy = false,
        config = function()
            require("themery").setup({
                livePreview = true,
                themes = {
                    "catppuccin",
                    "gruvbox",
                    "tokyonight",
                    "rose-pine",
                    "nightfox",
                    "kanagawa",
                    "onedark",
                    "github_dark",
                    "github_dark_default",
                    "github_dark_dimmed",
                    "github_dark_high_contrast",
                    "github_dark_colorblind",
                    "github_dark_tritanopia",
                    "github_light",
                    "github_light_default",
                    "github_light_high_contrast",
                    "github_light_colorblind",
                    "github_light_tritanopia",
                    "everforest",
                    "material",
                    "sonokai",
                    "edge",
                    "nord",
                    "dracula-soft",
                    "tokyodark",
                    "nightfly",
                    "moonfly",
                    "oxocarbon",
                    "melange",
                    "lucario",
                    "ayu",
                    "onedark",
                    "zenburn",
                    "neon",
                    "sunset_cloud",
                    "radioactive_waste",
                    "forest_stream",
                    "crimson_moonlight",
                    "dark_flat",
                    "midnight",
                    "onenord"
                }
            })
        end
    },
}

