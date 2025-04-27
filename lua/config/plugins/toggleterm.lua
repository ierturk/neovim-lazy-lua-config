return {
    "akinsho/toggleterm.nvim", -- Terminal integration
    version = "*",
    config = function()
        require("toggleterm").setup({
            size = 10, -- Height of the terminal
            open_mapping = [[<C-t>]], -- Keybinding to toggle the terminal
            direction = "horizontal", -- Open terminal at the bottom
            shade_terminals = true, -- Dim the background of the terminal
            persist_size = true, -- Remember terminal size
        })

        -- Keybindings for terminal management
        vim.keymap.set("n", "<C-t>", "<Cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
        vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
    end,
}
