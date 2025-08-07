-- Lazy.nvim plugin setup for conform
return {
    {
        'conform.nvim',
        config = function()
            require('conform').setup({
                formatters = {
                    python = { 'black' },
                    java = { 'google-java-format' },
                    html = { 'prettier' },
                    css = { 'prettier' },
                    c = { 'clang-format' }
                },
            })
        end,
    },
}
