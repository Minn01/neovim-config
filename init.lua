-- OPTIONS (vim_options.lua) --
require("vim_options").setup()

-- KEYMAPS (keymaps.lua) --
require("keymaps").setup()

-- CUSTOM COMMANDS ("custom_commands.lua")
require("custom_commands").setup()

-- PLUGINS --

-- adding the path manually so that nvim knows where to look for lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- if the path doesn't exist just clone lazy.nvim from git auto
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

-- adds lazy.nvim to the runtime path
vim.opt.rtp:prepend(lazypath)

-- lazy.nvim setup (it's a plugins manager)
require("lazy").setup({
    -- Auto close tag for markup languages
    require("auto_tag"),

    -- Treesitter
    require("treesitter_setup"),

    -- Status Bar --
    require("lualine_setup"),

    -- telescope --
    -- "nvim-telescope/telescope.nvim", -- Fuzzy finder
    require("telescope_setup"),

    -- color themes plugin (themes.lua) --
    require("themes"),

    -- themery_plugin (themery_setup.lua) --
    require("themery_setup"),

    -- nvim_tree plugin (file_tree.lua) --
    require("file_tree"),

    -- bufferline tabs (bufferline.lua)
    require("bufferline-config"),

    -- lspconfigs via mason (lsp.lua)
    require("lsp"),

    -- autopair bracket closing feature (autopair.txt)
    require("autopair"),

    -- surround vim feature (vim_surround.lua)
    require("vim_surround"),

    -- autoformattering (conform.lua)
    require("conform_setup"),

    -- indentation guidelines (indent_guides.lua)
    require("indent_guides"),

    -- code runner (code_runner.lua)
    require("code_runner_setup"),

    -- mardown renderer (markdown_read.lua)
    require("markdown_read"),

    -- bottom command line bar (noice_cmd.lua)
    require("noice_cmd"),

    -- live sever for web dev
    require("live_sever"),

    -- comment annotations
    require("comment_annotations"),

    -- bookmarks (bookmarks.lua)
    require("bookmark"),

    -- comment (comment_setup.lua)
    require("comment_setup"),

    -- startup screen (startup_screen.lua)
    require("startup_screen"),

    -- line column setup (number_line.lua)
    require("number_line"),

    -- show vim commands (show_key.lua)
    require("show_key"),
})
