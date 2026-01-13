return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = function()
            -- 1. Setup nvim-notify
            require("notify").setup({
                stages = "fade",
                timeout = 1500, -- timeout in milliseconds
                top_down = false,
                render = "default",
            })
            -- 2. Setup Noice
            require("noice").setup({
                routes = {
                    {
                        -- Catch "written" messages (with quotes in the filename)
                        filter = {
                            event = "msg_show",
                            kind = "",
                            find = "written",
                        },
                        view = "notify",
                    },
                    {
                        -- Also catch plain write confirmations
                        filter = {
                            event = "msg_show",
                            find = "^\".*\" %d+L, %d+B written$",
                        },
                        view = "notify",
                    },
                    {
                        -- Catch search messages (hit BOTTOM, hit TOP)
                        filter = {
                            event = "msg_show",
                            kind = "wmsg",
                        },
                        view = "notify",
                    },
                    {
                        -- Catch search pattern messages
                        filter = {
                            event = "msg_show",
                            find = "search hit",
                        },
                        view = "notify",
                    },
                },
                cmdline = {
                    view = "cmdline_popup",
                },
                views = {
                    cmdline_popup = {
                        position = {
                            row = "90%",
                            col = "50%",
                        },
                        size = {
                            width = 60,
                            height = "auto",
                        },
                        border = {
                            style = "rounded",
                            padding = { 0, 1 },
                        },
                        win_options = {
                            winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
                        },
                    },
                    notify = {
                        position = {
                            row = "90%", -- near the bottom
                            col = "50%",
                        },
                        size = {
                            width = 80,
                            height = "auto",
                        },
                        border = {
                            style = "rounded",
                            padding = { 0, 1 },
                        },
                        win_options = {
                            winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
                            wrap = true, -- allow wrapping
                        },
                    },
                },
                messages = {
                    view = "notify",
                },
                lsp = {
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                    },
                },
                presets = {
                    bottom_search = false,
                    command_palette = true,
                    long_message_to_split = true,
                    inc_rename = false,
                    lsp_doc_border = false,
                },
            })
        end,
    },
}
