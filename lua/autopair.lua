return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter", -- lazy-load when you enter insert mode
		config = function()
			require("nvim-autopairs").setup()
		end,
	},
	{
		"mattn/emmet-vim",
		event = "InsertEnter",
		config = function()
			vim.g.user_emmet_leader_key = "<C-y>"
		end,
	},
}
