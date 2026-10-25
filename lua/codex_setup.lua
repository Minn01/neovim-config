return {
	"nwiizo/codex.nvim",
	-- Avoid reusing another plugin that also installs as `codex.nvim`.
	name = "nwiizo-codex.nvim",
	cmd = {
		"Codex",
		"CodexOpen",
		"CodexClose",
		"CodexFocus",
		"CodexResume",
		"CodexContinue",
		"CodexReview",
		"CodexPrompt",
		"CodexAsk",
		"CodexFollowUp",
		"CodexEdit",
		"CodexSendVisual",
		"CodexAdd",
		"CodexDiff",
		"CodexInterrupt",
		"CodexStop",
	},
	opts = {
		backend = "terminal",
		cmd = { "codex", "--no-alt-screen" },
		cwd = "root",
		terminal = {
			layout = "split",
			split_side = "right",
			split_width_percentage = 0.42,
			normal_mode_keys = { "<Esc>", "<A-n>" },
		},
		selection = {
			enabled = false,
			hint = false,
		},
	},
	init = function()
		vim.api.nvim_create_autocmd("TermOpen", {
			callback = function(args)
				if vim.b[args.buf].codex_nvim_terminal then
					vim.keymap.set("t", "<C-]>", "<Esc>", {
						buffer = args.buf,
						desc = "Send Escape to Codex",
					})
				end
			end,
		})
	end,
	keys = {
		{ "<leader>cc", "<cmd>CodexFocus<cr>", desc = "Focus or hide Codex" },
		{ "<leader>cq", "<cmd>CodexAsk<cr>", desc = "Ask Codex about this file" },
		{ "<leader>cA", "<cmd>CodexAdd<cr>", desc = "Add current file to Codex" },
		{ "<leader>cf", "<cmd>CodexFollowUp<cr>", desc = "Follow up with Codex" },
		{
			"<leader>cs",
			":<C-U>CodexSendVisual<CR>",
			mode = "v",
			desc = "Send selection to Codex",
		},
		{
			"<leader>ce",
			":<C-U>CodexEdit<CR>",
			mode = "v",
			desc = "Ask Codex to edit selection",
		},
	},
}
