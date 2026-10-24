local KM = {}

-- Graceful LSP shutdown on quit
local function clean_quit()
	-- Use get_clients() instead of get_active_clients()
	local clients = vim.lsp.get_clients()
	for _, client in ipairs(clients) do
		client.stop()
	end

	vim.defer_fn(function()
		vim.cmd("qa!")
	end, 100)
end

function KM.setup()
	local opts = { noremap = true, silent = true }

	-- =========================================================================
	-- FILE & BUFFER MANAGEMENT
	-- =========================================================================
	-- Save with notification - silent=false lets Noice catch the message
	vim.keymap.set("n", "<leader>w", ":w<CR>", opts)

	-- custom clean quit function to gracefully shutdown LSPs
	vim.keymap.set("n", "<leader>q", clean_quit, { desc = "Clean Quit this session" })
	vim.keymap.set("n", "<leader>iq", ":q<CR>", { desc = "Soft Quit this session" })
	vim.keymap.set("n", "<leader>!q", clean_quit, { desc = "Force Clean Quit" })

	-- Buffer Tabs (Top of screen)
	vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)
	vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opts)

	-- THE "INSTANT EXIT" (No delay on leader x)
	vim.keymap.set("n", "<leader>x", ":bd!<CR>", opts)

	-- File Explorer & Filesystem
	vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory (Oil)" })

	-- =========================================================================
	-- NAVIGATION & SPLITS
	-- =========================================================================
	vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
	vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to below split" })
	vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to above split" })
	vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })

	vim.keymap.set("n", "<leader>h", ":split<CR>", opts)
	vim.keymap.set("n", "<leader>v", ":vsplit<CR>", opts)

	-- HOP.NVIM (Jump across screen) - Flash alternative that actually works
	vim.keymap.set({ "n", "x", "o" }, "<leader>s", ":HopWord<CR>", { desc = "Hop to Word" })
	vim.keymap.set({ "n", "x", "o" }, "<leader>S", ":HopLine<CR>", { desc = "Hop to Line" })
	vim.keymap.set({ "n", "x", "o" }, "<leader>/", ":HopPattern<CR>", { desc = "Hop to Pattern" })

	-- =========================================================================
	-- LSP & CODING
	-- =========================================================================
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
	vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action (Fix)" })
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })
	vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show Line Error" })

	-- TROUBLE.NVIM
	vim.keymap.set("n", "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Project Diagnostics" })
	vim.keymap.set(
		"n",
		"<leader>tX",
		"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
		{ desc = "Current File Diagnostics" }
	)
	vim.keymap.set("n", "<leader>ts", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "File Symbols" })

	-- =========================================================================
	-- MISC TOOLS & UI
	-- =========================================================================
	vim.keymap.set("n", "<leader>ln", function()
		vim.opt.relativenumber = not vim.opt.relativenumber:get()
	end, { desc = "Toggle Relative Numbers" })

	vim.keymap.set("n", "<leader>th", ":Themery<CR>", opts)

	-- Format and Run should be LOUD so you know they actually triggered
	vim.keymap.set("n", "<leader>rr", ":RunCode<CR>", { silent = false, desc = "Run Project" })
	vim.keymap.set("n", "<leader>fm", ":Fm<CR>", { silent = false, desc = "Format Code" })

	vim.keymap.set("n", "<leader>md", ":MarkdownPreview<CR>", opts)

	-- Bookmarks
	vim.keymap.set("n", "ml", "<Cmd>BookmarksListAll<CR>", { desc = "List Bookmarks" })

	vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit Terminal Mode" })
end

return KM
