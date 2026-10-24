return {
	"MeanderingProgrammer/render-markdown.nvim",
	ft = { "markdown" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		code = {
			border = "thin",
			width = "block",
			left_pad = 1,
			right_pad = 1,
		},
		heading = {
			border = true,
			sign = false,
		},
		overrides = {
			buftype = {
				nofile = {
					render_modes = true,
					sign = { enabled = false },
				},
			},
		},
	},
}
