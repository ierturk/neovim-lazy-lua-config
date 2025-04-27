-- Main lazy.nvim setup

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
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
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- tools
    require("config.plugins.which-key"),
    require("config.plugins.nvim-cmp"),
    require("config.plugins.vim-tmux-navigator"),
    require("config.plugins.telescope"),

    -- ui config
    -- require("config.plugins.tokyonight"),
    require("config.plugins.onedark"),
    -- require("config.plugins.onedarkpro"),
    require("config.plugins.bufferline"),
    require("config.plugins.lualine"),
    require("config.plugins.symbols-outline"),
    require("config.plugins.toggleterm"),
    require("config.plugins.neo-tree"),
    require("config.plugins.edgy"),

    -- copilot tools
    require("config.plugins.copilot"),
    require("config.plugins.copilot-cmp"),
    require("config.plugins.copilot-chat"),

    -- lsp tools
    require("config.plugins.nvim-lspconfig"),
    require("config.plugins.nvim-treesitter"),

    -- debug tools
    require("config.plugins.nvim-dap"),
    require("config.plugins.nvim-bqf"),

    -- git tools
    require("config.plugins.lazygit"),
    require("config.plugins.gitsigns"),
})
