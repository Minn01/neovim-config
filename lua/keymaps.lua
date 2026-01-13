local KM = {}

function KM.setup()
    vim.g.mapleader = " " -- Ensure Space is the leader

    -- We define two sets of options:
    local opts = { noremap = true, silent = true }  -- For quiet actions
    local loud = { noremap = true, silent = false } -- For actions that need notifications (Save, etc.)

    -- =========================================================================
    -- FILE & BUFFER MANAGEMENT
    -- =========================================================================
    -- Save with notification - silent=false lets Noice catch the message
    vim.keymap.set('n', '<leader>w', ':w<CR>', loud)

    vim.keymap.set('n', '<leader>q', ':q<CR>', opts)
    vim.keymap.set('n', '<leader>!q', ':q!<CR>', opts)

    -- Buffer Tabs (Top of screen)
    vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)
    vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opts)

    -- THE "INSTANT EXIT" (No delay on leader x)
    vim.keymap.set("n", "<leader>x", ":bd!<CR>", opts)

    -- File Explorer & Filesystem
    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
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
    -- SEARCH (Telescope)
    -- =========================================================================
    -- Changed these to loud so you see search status messages in Noice/Notify
    vim.keymap.set("n", "<leader>ff", function()
        require('telescope.builtin').find_files({ cwd = vim.fn.getcwd() })
    end, { desc = "Find Files in Project Root" })
    vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", loud)
    vim.keymap.set("n", "<leader>fa", ":Telescope live_grep no_ignore=true<CR>", loud)
    vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", loud)
    vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", loud)
    vim.keymap.set("n", "<leader>fz", ":Telescope current_buffer_fuzzy_find<CR>", loud)

    -- =========================================================================
    -- LSP & CODING
    -- =========================================================================
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to Definition" })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Hover Documentation" })
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Code Action (Fix)" })
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Rename Symbol" })
    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show Line Error" })

    -- TROUBLE.NVIM
    vim.keymap.set("n", "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Project Diagnostics" })
    vim.keymap.set("n", "<leader>tX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        { desc = "Current File Diagnostics" })
    vim.keymap.set("n", "<leader>ts", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "File Symbols" })

    -- Comment Annotations
    vim.keymap.set("n", "]t", function() require("todo-comments").jump_next() end, { desc = "Next todo comment" })
    vim.keymap.set("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "Previous todo comment" })

    -- =========================================================================
    -- MISC TOOLS & UI
    -- =========================================================================
    vim.keymap.set("n", "<leader>ln", function()
        vim.opt.relativenumber = not vim.opt.relativenumber:get()
    end, { desc = "Toggle Relative Numbers" })

    vim.keymap.set("n", "<leader>th", ":Themery<CR>", opts)
    
    -- Quick fix for when directory gets messed up
    vim.keymap.set("n", "<leader>cd", ":Cd<CR>", { desc = "Fix Working Directory" })

    -- Format and Run should be LOUD so you know they actually triggered
    vim.keymap.set("n", "<leader>rr", ":RunCode<CR>", { silent = false, desc = "Run Project" })
    vim.keymap.set("n", "<leader>fm", ":Fm<CR>", { silent = false, desc = "Format Code" })

    vim.keymap.set("n", "<leader>md", ":MarkdownPreview<CR>", opts)

    -- Bookmarks
    vim.keymap.set("n", "ml", "<Cmd>BookmarksListAll<CR>", { desc = "List Bookmarks" })

    -- Terminals
    vim.keymap.set("n", "<leader>ch", ":split | lcd %:p:h | terminal<CR>", { desc = "Terminal (H) in current dir" })
    vim.keymap.set("n", "<leader>cv", ":vsplit | lcd %:p:h | terminal<CR>", { desc = "Terminal (V) in current dir" })
    vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit Terminal Mode" })
end

return KM
