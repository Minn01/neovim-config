vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
	{
		"stevearc/oil.nvim",
		lazy = false,

		config = function()
			require("oil").setup()

			vim.api.nvim_create_autocmd("VimEnter", {
				callback = function()
					local arg = vim.fn.argv(0)

					if arg and vim.fn.isdirectory(arg) == 1 then
						require("oil").open(arg)
					end
				end,
			})
		end,
	},
}
