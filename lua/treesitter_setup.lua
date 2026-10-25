local languages = {
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
	"markdown_inline",
	"regex",
}

return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").install(languages)

			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("treesitter_highlighting", { clear = true }),
				callback = function()
					pcall(vim.treesitter.start)
				end,
			})
		end,
	},

	{
		"windwp/nvim-ts-autotag",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		event = "InsertEnter",
		opts = {},
	},
}
