return {
    "folke/which-key.nvim", -- Keybinding helper
    enabled = true,
    event = "VeryLazy",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {},
    keys = {
        {
            "<leader>/",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
}
