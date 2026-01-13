local M = {}

function M.CustomConfig(server, opts)
    if server == "lua_ls" then
        opts.settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" }, -- Tells LSP that 'vim' is a real thing
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true), -- Makes LSP aware of Neovim files
                    checkThirdParty = false,
                },
            },
        }
    end

    return opts
end

return M
