local custom_commands = {}

function custom_commands.setup()
    -- Horizontal terminal with fixed height
    vim.api.nvim_create_user_command("TermBot", function()
        vim.cmd("belowright 12split | terminal")
    end, {})

    -- Vertical terminal with fixed width
    vim.api.nvim_create_user_command("TermRight", function()
        vim.cmd("rightbelow vertical 40split | terminal")
    end, {})

    -- Manural file formatting
    vim.api.nvim_create_user_command("Fm", function()
        require("conform").format({ async = true, lsp_fallback = true })
    end, {})
end

return custom_commands
