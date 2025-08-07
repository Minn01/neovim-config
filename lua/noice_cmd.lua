return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = function()
            require("notify").setup({
                stages = "fade",
                timeout = 1500,  -- timeout in milliseconds
                top_down = false,
                render = "default",
            })

            require("noice").setup({
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
                            row = "90%",  -- near the bottom
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
                    timeout = 700,
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

