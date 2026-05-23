local custom_commands = {}

function custom_commands.setup()
    -- THE FIX: Cd command to set working directory to current file's directory
    vim.api.nvim_create_user_command("Cd", function()
        local current_file = vim.fn.expand("%:p:h")
        if current_file ~= "" then
            vim.cmd("cd " .. current_file)
            vim.notify("Changed directory to: " .. current_file, vim.log.levels.INFO)
            -- Refresh NvimTree to show correct root
            if vim.fn.exists(":NvimTreeRefresh") > 0 then
                vim.cmd("NvimTreeRefresh")
            end
        end
    end, { desc = "Change directory to current file location" })

    -- Horizontal terminal with fixed height
    vim.api.nvim_create_user_command("TermBot", function()
        vim.cmd("belowright 12split | terminal")
    end, {})

    -- Vertical terminal with fixed width
    vim.api.nvim_create_user_command("TermRight", function()
        vim.cmd("rightbelow vertical 40split | terminal")
    end, {})

    -- Manual file formatting
    vim.api.nvim_create_user_command("Fm", function()
        require("conform").format({ async = true, lsp_fallback = true })
    end, {})
end

return custom_commands
