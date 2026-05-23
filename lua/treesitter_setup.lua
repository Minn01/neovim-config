return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua",
					"python",
					"javascript",
					"typescript",
					"tsx",
					"html",
					"css",
					"json",
					"bash",
					"markdown",
				},

				highlight = {
					enable = true,
				},

				autotag = {
					enable = true, -- ✅ REQUIRED
					enable_close = true,
					enable_rename = true,
					enable_close_on_slash = false,
				},
			})
		end,
	},

	{
		"windwp/nvim-ts-autotag",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		event = "InsertEnter",
	},
}
