local KM = {}

function KM.setup()
    vim.g.mapleader = " " -- Set leader key to Space

    -- Quitting
    vim.keymap.set('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>!q', ':q!<CR>', { noremap = true, silent = true })

    -- Save File
    vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })

    -- Open Theme selector (Themery)
    vim.keymap.set('n', '<leader>tt', ':Themery<CR>', { noremap = true, silent = true })

    -- Toggle Nvim-tree the side tab
    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

    -- Move between buffers
    vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true })
    vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true })

    -- Close current buffer
    vim.keymap.set("n", "<leader>x", ":bd!<CR>", { silent = true })

    -- Telescope or fuzzy finder
    vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { noremap = true, silent = true }) -- search words in files
    vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { noremap = true, silent = true })   -- open buffer list
    vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", { noremap = true, silent = true }) -- help pages
    -- Comment Annotations
    vim.keymap.set("n", "]t", function() require("todo-comments").jump_next() end, { desc = "Next todo comment" })
    vim.keymap.set("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "Previous todo comment" })

    -- Tab splitting
    vim.keymap.set("n", "<leader>h", ":split<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>v", ":vsplit<CR>", { noremap = true, silent = true })

    -- Tabsplit movement
    vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
    vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to below split" })
    vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to above split" })
    vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })

    -- Terminal split
    vim.keymap.set("n", "<leader>ch", ":split | terminal<CR>", { desc = "Horizontal Terminal" }) -- Horizontal terminal
    vim.keymap.set("n", "<leader>cv", ":vsplit | terminal<CR>", { desc = "Vertical Terminal" })  -- Vertical terminal
    vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })                 -- Exit terminal mode easily

    -- Formatting
    vim.keymap.set("n", "<leader>fm", ":Fm<CR>", { silent = true })

    -- Code Runner
    vim.keymap.set("n", "<leader>rr", ":RunCode<CR>", { silent = true, desc = "Running current file..." })

    -- Markdown Preview
    vim.keymap.set("n", "<leader>md", ":MarkdownPreview<CR>", { silent = true, desc = "Running current file..." })

    -- Bookmarks
    vim.keymap.set("n", "mm", "<Cmd>BookmarksMarkToggle<CR>", { desc = "Toggle Bookmark" })
    vim.keymap.set("n", "ml", "<Cmd>BookmarksList<CR>", { desc = "List Bookmarks" })

    -- Toggle Diagnostic Text Display
    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)

    -- Toggle Relatie number
    vim.keymap.set("n", "<leader>rn", function()
        vim.opt.relativenumber = not vim.opt.relativenumber:get()
    end, { desc = "Toggle Relative Numbers" })
end

return KM
