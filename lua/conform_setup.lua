-- Lazy.nvim plugin setup for conform
-- return {
--     {
--         'conform.nvim',
--         config = function()
--             require('conform').setup({
--                 formatters = {
--                     python = { 'black' },
--                     java = { 'google-java-format' },
--                     html = { 'prettier' },
--                     css = { 'prettier' },
--                     c = { 'clang-format' }
--                 },
--             })
--         end,
--     },
-- }


return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre", "BufNewFile" },
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          python = { "black" },
          java = { "google-java-format" },
          c = { "clang-format" },

          -- Frontend / Next.js
          javascript = { "prettier" },
          javascriptreact = { "prettier" },
          typescript = { "prettier" },
          typescriptreact = { "prettier" },
          html = { "prettier" },
          css = { "prettier" },
          json = { "prettier" },
          markdown = { "prettier" },
        },

        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
      })
    end,
  },
}
