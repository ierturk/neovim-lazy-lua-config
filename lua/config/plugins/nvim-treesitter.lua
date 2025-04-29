return {
    "nvim-treesitter/nvim-treesitter", -- Syntax highlighting
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            highlight = { enable = true },
            ensure_installed = { "cmake" },
        })
    end,
}
