return {
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("bufferline").setup({
                options = {
                    mode = "buffers",   -- show buffers, not tabs
                    diagnostics = "nvim_lsp", -- show LSP errors/warnings
                    offsets = {
                        {
                            filetype = "NvimTree",
                            text = "File Explorer",
                            separator = true,
                            highlight = "Directory",
                            text_align = "left"
                        }
                    },
                    options = {
                        hover = {
                            enabled = true,
                            delay = 200,
                            reveal = { 'close' }
                        }
                    },
                    separator_style = "slant",
                    show_buffer_close_icons = true,
                    show_close_icon = false,
                }
            })
        end
    }
}
