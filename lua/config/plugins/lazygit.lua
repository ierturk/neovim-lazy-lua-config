return {
    "kdheepak/lazygit.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        vim.keymap.set("n", "<leader>lg", ":LazyGit<CR>", { noremap = true, silent = true, desc = "Open LazyGit" })
    end,
}
