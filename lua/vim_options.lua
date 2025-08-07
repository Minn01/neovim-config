local VOpt = {}

function VOpt.setup()
    vim.opt.number = true
    vim.opt.relativenumber = true
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true
    vim.opt.termguicolors = true

    -- End of buffer line (used to be ~)
    vim.opt.fillchars = { eob = " " }

    -- allow mouse movement
    vim.o.mouse = "a"

    -- default split directions
    vim.opt.splitbelow = true
    vim.opt.splitright = true

    -- use system clipoard by default
    vim.o.clipboard = "unnamedplus"
end

return VOpt
