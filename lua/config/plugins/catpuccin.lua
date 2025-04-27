return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000, -- Ensure it loads first
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- Options: "latte", "frappe", "macchiato", "mocha"
      transparent_background = false, -- Disable transparency
      term_colors = true, -- Use terminal colors
      integrations = {
        -- lualine = true, -- Enable Lualine integration
        nvimtree = true, -- Enable Neo-tree integration (uses nvimtree colors)
        bufferline = true, -- Enable Bufferline integration
        treesitter = true, -- Enable Treesitter integration
        telescope = true, -- Enable Telescope integration
        cmp = true, -- Enable nvim-cmp integration
      },
    })
    vim.cmd("colorscheme catppuccin") -- Apply the Catppuccin theme
  end,
}
