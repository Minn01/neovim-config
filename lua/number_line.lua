return {
    {
        "luukvbaal/statuscol.nvim",
        config = function()
            local builtin = require("statuscol.builtin")
            require("statuscol").setup({
                relculright = true,
                segments = {
                    {
                        text = { "%s" }, -- sign column
                        click = "v:lua.ScSa"
                    },
                    {
                        text = { builtin.lnumfunc, " " }, -- use builtin to handle relative & absolute numbers properly
                        condition = { true, builtin.not_empty },
                        click = "v:lua.ScLa"
                    },
                }
            })
        end,
    }
}
