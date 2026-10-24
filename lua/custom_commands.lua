local custom_commands = {}

function custom_commands.setup()
    -- Manual file formatting
    vim.api.nvim_create_user_command("Fm", function()
        require("conform").format({ async = true, lsp_fallback = true })
    end, {})
end

return custom_commands
