return {
    "akinsho/toggleterm.nvim", -- Terminal integration
    version = "*",
    config = function()
        require("toggleterm").setup({
            size = 20,
            open_mapping = [[<C-t>]],
            direction = "float", -- Use floating windows for ToggleTerm
            float_opts = {
                border = "curved", -- Border style for floating terminal
                width = 120,
                height = 40,
                winblend = 5, -- Transparency
            },
        })
        
        -- Keybindings for terminal management
        vim.keymap.set("n", "<C-t>", "<Cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
        vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
    end,
}
