return {
    {
        "goolord/alpha-nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local alpha = require("alpha")
            local dashboard = require("alpha.themes.dashboard")
            -- header color
            dashboard.section.header.opts.hl = "AlphaHeader"
            vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#face4d" }) -- bright yellow
            dashboard.section.header.val = {
                "                        _,     _   _    ,_",
                "                    .o888P     Y8o8Y     Y888o.",
                "                   d88888      88888      88888b",
                "                  d888888b_  _d88888b_  _d888888b",
                "                  8888888888888888888888888888888",
                "                  8888888888888888888888888888888",
                "                  YJGS8P\"Y888P\"Y888P\"Y888P\"Y8888P",
                "                   Y888   '8'   Y8P   '8'   888Y",
                "                    '8o          V          o8'",
                "",
                "    .__   __.  _______   ______   ____    ____  __  .___  ___.",
                "    |  \\ |  | |   ____| /  __  \\  \\   \\  /   / |  | |   \\/   |",
                "    |   \\|  | |  |__   |  |  |  |  \\   \\/   /  |  | |  \\  /  |",
                "    |  . `  | |   __|  |  |  |  |   \\      /   |  | |  |\\/|  |",
                "    |  |\\   | |  |____ |  `--'  |    \\    /    |  | |  |  |  |",
                "    |__| \\__| |_______| \\______/      \\__/     |__| |__|  |__|",
                "",
                " Yesterday is History, Tomorrow is a Mystery, but Today is a Gift",
                "               That is why its called \"The Present\""
            }
            -- Buttons
            dashboard.section.buttons.val = {
                dashboard.button("e", "  New file", ":ene <BAR> startinsert<CR>"),
                dashboard.button("r", "  Recent", ":Telescope oldfiles<CR>"),
                dashboard.button("l", "  Lazy", ":Lazy<CR>"),
                dashboard.button("c", "  Settings", ":cd ~/.config/nvim | e init.lua | NvimTreeOpen<CR>"),
            }
            -- Centering & layout tweaking
            dashboard.opts.layout = {
                { type = "padding", val = 2 },
                dashboard.section.header,
                { type = "padding", val = 2 },
                dashboard.section.buttons,
                { type = "padding", val = 1 },
                dashboard.section.footer,
            }
            dashboard.opts.opts.noautocmd = true
            alpha.setup(dashboard.opts)
        end,
    }
}
