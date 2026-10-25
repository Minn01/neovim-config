local function project_root()
	return Snacks.git.get_root() or vim.fn.getcwd()
end

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		explorer = {
			enabled = true,
			-- Oil remains the default handler when Neovim opens a directory.
			replace_netrw = false,
		},
		indent = {
			enabled = true,
			indent = { char = "│" },
			scope = { enabled = true },
		},
		picker = {
			enabled = true,
			sources = {
				files = { hidden = true },
				buffers = {
					current = false,
					sort_lastused = true,
				},
				explorer = {
					hidden = true,
					layout = {
						layout = {
							position = "right",
							width = 30,
							min_width = 30,
						},
					},
				},
			},
		},
		dashboard = {
			enabled = true,
			width = 124,
			sections = { require("dashboard_layout") },
		},
		statuscolumn = { enabled = true },
		terminal = {
			win = {
				keys = {
					term_normal = { "<Esc>", [[<C-\><C-n>]], mode = "t", desc = "Exit terminal mode" },
				},
			},
		},
		lazygit = {},
	},
	keys = {
		{ "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
		{ "<leader>gg", function() Snacks.lazygit({ cwd = project_root() }) end, desc = "Open LazyGit" },
		{
			"<leader>ch",
			function()
				Snacks.terminal(nil, {
					cwd = project_root(),
					count = 1,
					win = { position = "bottom", height = 12 },
				})
			end,
			desc = "Horizontal Terminal",
		},
		{
			"<leader>cv",
			function()
				Snacks.terminal(nil, {
					cwd = project_root(),
					count = 2,
					win = { position = "right", width = 40 },
				})
			end,
			desc = "Vertical Terminal",
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.files({ cwd = project_root() })
			end,
			desc = "Find Files in Project Root",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.grep({ cwd = project_root() })
			end,
			desc = "Grep Project",
		},
		{
			"<leader>fa",
			function()
				Snacks.picker.grep({ cwd = project_root(), hidden = true, ignored = true })
			end,
			desc = "Grep All Files",
		},
		{ "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
		{ "<leader>fh", function() Snacks.picker.help() end, desc = "Help Pages" },
	},
}
