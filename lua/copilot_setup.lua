return {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    config = function()
        require("copilot").setup({
            suggestion = {
                enabled = true,
                auto_trigger = true,
                debounce = 75,
                keymap = {
                    accept  = "<C-l>",
                    next    = "<M-]>",
                    prev    = "<M-[>",
                    dismiss = "<C-e>",
                },
            },
            panel = {
                enabled = false, -- disable the Copilot panel (inline only)
            },
        })

        -- 🔁 Toggle Copilot (practice mode vs get-things-done mode)
        vim.keymap.set("n", "<leader>ac", function()
            require("copilot.suggestion").toggle()
        end, { desc = "Toggle Copilot AI" })
    end,
}
