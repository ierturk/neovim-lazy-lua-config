return {
    "folke/tokyonight.nvim", -- VS Code-like color scheme
    enabled = true,
    priority = 1000, -- Ensure it loads first
    config = function()
        vim.cmd("colorscheme tokyonight") -- Set the color scheme
    end,
}
