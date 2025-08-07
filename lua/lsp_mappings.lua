-- Setup LSP-related keymaps (add inside your LSP on_attach function ideally)
local M = {}
function M.lsp_keymaps(bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- LSP navigation
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

    -- Info & docs
    vim.keymap.set('n', 'gk', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gkb', vim.lsp.buf.signature_help, opts)

    -- Actions
    vim.keymap.set('n', 'gr', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', 'gc', vim.lsp.buf.code_action, opts)

    -- Diagnostics
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<leader>ge', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '<leader>gl', vim.diagnostic.setloclist, opts)
end

return M
