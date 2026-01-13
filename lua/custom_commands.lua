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

    -- Auto-detect and set project root when opening a file
    vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
            local file = vim.fn.expand("%:p")
            if file ~= "" and vim.fn.isdirectory(file) == 0 then
                -- Try to find project root by looking for common markers
                local markers = {".git", "package.json", "Cargo.toml", "go.mod", ".project"}
                local current_dir = vim.fn.expand("%:p:h")
                
                local function find_root(dir)
                    for _, marker in ipairs(markers) do
                        if vim.fn.isdirectory(dir .. "/" .. marker) == 1 or 
                           vim.fn.filereadable(dir .. "/" .. marker) == 1 then
                            return dir
                        end
                    end
                    local parent = vim.fn.fnamemodify(dir, ":h")
                    if parent == dir then
                        return nil
                    end
                    return find_root(parent)
                end
                
                local root = find_root(current_dir)
                if root then
                    vim.cmd("cd " .. root)
                    -- Refresh NvimTree
                    vim.schedule(function()
                        if vim.fn.exists(":NvimTreeRefresh") > 0 then
                            vim.cmd("NvimTreeRefresh")
                        end
                    end)
                end
            end
        end
    })

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
