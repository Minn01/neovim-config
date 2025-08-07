return {
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons', -- icons
        },
        config = function()
            require("nvim-tree").setup({
                sort_by = "case_sensitive",
                view = {
                    width = 27,
                    side = "left",
                    preserve_window_proportions = true,
                },
                renderer = { group_empty = true, },
                update_focused_file = {
                    enable = true,
                    update_cwd = true,
                },
                filters = { dotfiles = false },
            })

            vim.keymap.set('n', '<leader>nr', function ()
                require('nvim-tree.api').tree.change_root_to_node()
            end, { desc = 'Nvim tree: Set root to current node'})
        end
    }
}

