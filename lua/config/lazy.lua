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
    require("config.plugins.ui"),
    require("config.plugins.lsp"),
    require("config.plugins.git"),
    require("config.plugins.tools"),
    require("config.plugins.lazygit"),
    require("config.plugins.tree"),
    require("config.plugins.dap"),
})
