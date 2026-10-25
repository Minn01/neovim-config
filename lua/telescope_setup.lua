return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<leader>fz",
			function()
				require("telescope.builtin").current_buffer_fuzzy_find()
			end,
			desc = "Find in Current Buffer",
		},
	},
}
