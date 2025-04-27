return {
    "nvim-telescope/telescope.nvim", -- Fuzzy finder
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").setup()
    end,
}
