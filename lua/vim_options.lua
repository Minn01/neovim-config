local VOpt = {}

local function iterm_set_profile(profile)
    if vim.env.TERM_PROGRAM == "iTerm.app" then
        vim.api.nvim_chan_send(
            vim.v.stderr,
            string.format("\27]1337;SetProfile=%s\7", profile)
        )
    end
end

function VOpt.setup()
    vim.opt.number = true
    vim.opt.relativenumber = true
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true
    vim.opt.termguicolors = true

    vim.opt.fillchars = { eob = " " }
    vim.opt.mouse = "a"
    vim.opt.splitbelow = true
    vim.opt.splitright = true
    vim.opt.clipboard = "unnamedplus"

    local iterm_group = vim.api.nvim_create_augroup("ItermProfileSwitch", { clear = true })

    -- Switch to Neovim profile on enter
    vim.api.nvim_create_autocmd("VimEnter", {
        group = iterm_group,
        callback = function()
            vim.schedule(function()
                iterm_set_profile("Neovim")
            end)
        end,
    })

    -- Switch back BEFORE Neovim fully exits
    vim.api.nvim_create_autocmd("VimLeave", {
        group = iterm_group,
        callback = function()
            vim.schedule(function()
                iterm_set_profile("Default")
            end)
        end,
    })
end

return VOpt
