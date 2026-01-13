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
    { import = "auto_tag" },
    -- Treesitter
    { import = "treesitter_setup" },
    -- Status Bar --
    { import = "lualine_setup" },

    -- telescope --
    -- "nvim-telescope/telescope.nvim", -- Fuzzy finder
    { import = "telescope_setup" },

    -- color themes plugin (themes.lua) --
    { import = "themes" },
    -- themery_plugin (themery_setup.lua) --
    { import = "themery_setup" },
    -- nvim_tree plugin (file_tree.lua) --
    { import = "file_tree" },
    -- bufferline tabs (bufferline.lua)
    { import = "bufferline-config" },
    -- lspconfigs via mason (lsp.lua)
    { import = "lsp" },
    -- autopair bracket closing feature (autopair.txt)
    { import = "autopair" },
    -- surround vim feature (vim_surround.lua)
    { import = "vim_surround" },
    -- autoformattering (conform.lua)
    { import = "conform_setup" },
    -- indentation guidelines (indent_guides.lua)
    { import = "indent_guides" },
    -- code runner (code_runner.lua)
    { import = "code_runner_setup" },
    -- mardown renderer (markdown_read.lua)
    { import = "markdown_read" },
    -- bottom command line bar (noice_cmd.lua)
    { import = "noice_cmd" }, 
    -- live sever for web dev
    { import = "live_sever" },
    -- comment annotations
    { import = "comment_annotations" },
    -- bookmarks (bookmarks.lua)
    { import = "bookmark" },
    -- comment (comment_setup.lua)
    { import = "comment_setup" },
    -- startup screen (startup_screen.lua)
    { import = "startup_screen" },
    -- line column setup (number_line.lua)
    { import = "number_line" },
    -- show vim commands (show_key.lua)
    { import = "show_key" },
    -- git signs (git_signs.lua)
    { import = "git_signs" },
    -- copilot autocompletetion (copilot_setup.lua)
    { import = "copilot_setup" },
    -- trouble plugin (trouble.lua)
    { import = "folke_trouble" },
    -- hop plugin (hop.lua)
    { import = "hop_nvim" },
    -- oil file manager for file system editing (oil.lua)
    { import = "oil_setup" },
})

-- OPTIONS (vim_options.lua) --
require("vim_options").setup()

-- KEYMAPS (keymaps.lua) --
require("keymaps").setup()

-- CUSTOM COMMANDS ("custom_commands.lua")
require("custom_commands").setup()

