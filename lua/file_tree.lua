return {
	{
		"nvim-tree/nvim-tree.lua",
		cmd = {
			"NvimTreeToggle",
			"NvimTreeOpen",
		},
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- icons
		},
		config = function()
			require("nvim-tree").setup({
				-- sync_root_with_cwd = true,
				-- respect_buf_cwd = true,

				sync_root_with_cwd = false,
				respect_buf_cwd = false,

				sort_by = "case_sensitive",
				view = {
					width = 30,
					side = "right",
					preserve_window_proportions = true,
				},
				renderer = { group_empty = true },
				update_focused_file = {
					enable = true,
					update_cwd = true,
					update_root = false,
				},
				filters = { dotfiles = false },
			})

			vim.keymap.set("n", "<leader>nr", function()
				require("nvim-tree.api").tree.change_root_to_node()
			end, { desc = "Nvim tree: Set root to current node" })
		end,
	},
}
