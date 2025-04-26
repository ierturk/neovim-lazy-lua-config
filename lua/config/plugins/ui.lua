-- UI-related plugins

return {
    {
        "nvim-lualine/lualine.nvim", -- Statusline
        config = function()
            require("lualine").setup()
        end,
    },
    {
        "kyazdani42/nvim-tree.lua", -- File explorer
        enabled = false, -- Disable by default
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- Icons for the tab bar
        config = function()
            require("nvim-tree").setup({
                filesystem_watchers = {
                    enable = false, -- Disable file watchers to avoid ENOSYS errors
                },
            })
        end,
    },
    {
        "folke/tokyonight.nvim", -- VS Code-like color scheme
        priority = 1000, -- Ensure it loads first
        config = function()
            vim.cmd("colorscheme tokyonight") -- Set the color scheme
        end,
    },
    {
        "akinsho/bufferline.nvim", -- Tab bar for buffers
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- Icons for the tab bar
        config = function()
            require("bufferline").setup({
                options = {
                    numbers = "none", -- No buffer numbers
                    diagnostics = "nvim_lsp", -- Show LSP diagnostics in the tab bar
                    separator_style = "slant", -- Style of separators between tabs
                    show_buffer_close_icons = true, -- Show close icons for buffers
                    show_close_icon = false, -- Hide the main close icon
                    offsets = {
                        {
                            filetype = "NvimTree",
                            text = "File Explorer",
                            text_align = "center",
                            separator = true,
                        },
                    },
                },
            })
        end,
    },
}
