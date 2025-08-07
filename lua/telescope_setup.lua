-- telescope.lua --

return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('telescope').setup {
                defaults = {
                    mappings = {
                        i = {
                            ["<C-h>"] = "which_key",
                        },
                    },
                },
                pickers = {
                    find_files = {
                        hidden = true,
                    },
                    buffers = {
                        sort_mru = true,
                        ignore_current_buffer = true,
                    },
                },
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    },
                },
            }

            -- Load extension
            require('telescope').load_extension('fzf')
        end,
    },

    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = vim.fn.executable("make") == 1,
    }
}
