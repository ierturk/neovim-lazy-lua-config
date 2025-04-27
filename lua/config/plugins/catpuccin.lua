return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- Ensure it loads first
    config = function()
        require("catppuccin").setup({
            flavour = "macchiato", -- Options: "latte", "frappe", "macchiato", "mocha"
            transparent_background = true, -- Enable transparent background
            term_colors = true, -- Use terminal colors
            highlight_cursorline = true, -- Highlight the cursor line
            integrations = {
                lualine = true, -- Integrate with lualine.nvim
                nvimtree = true, -- Integrate with nvim-tree
                bufferline = true, -- Integrate with bufferline.nvim
                treesitter = true, -- Integrate with nvim-treesitter
                telescope = true, -- Integrate with telescope.nvim
                cmp = true, -- Integrate with nvim-cmp
            },
        })
        vim.cmd("colorscheme catppuccin") -- Apply the Catppuccin theme
    end,
}
