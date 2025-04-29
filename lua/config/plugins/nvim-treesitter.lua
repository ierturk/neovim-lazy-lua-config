return {
    "nvim-treesitter/nvim-treesitter", -- Syntax highlighting
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({

            -- Specify the languages you want to support
            ensure_installed = { "python", "lua", "cpp", "cmake", "rust" },

            -- Enable syntax highlighting
            highlight = {
                enable = true, -- Enable Treesitter-based syntax highlighting
                additional_vim_regex_highlighting = false, -- Disable regex-based highlighting for better performance
            },

            -- Enable incremental selection
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "gnn", -- Start selection
                    node_incremental = "grn", -- Increment to the next node
                    scope_incremental = "grc", -- Increment to the next scope
                    node_decremental = "grm", -- Decrement to the previous node
                },
            },

            -- Enable smart indentation
            indent = {
                enable = true,
            },

            -- Enable code folding
            folding = {
                enable = true,
            },

            -- Enable text objects for better navigation and selection
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true, -- Automatically jump forward to the text object
                    keymaps = {
                        ["af"] = "@function.outer", -- Select around a function
                        ["if"] = "@function.inner", -- Select inside a function
                        ["ac"] = "@class.outer", -- Select around a class
                        ["ic"] = "@class.inner", -- Select inside a class
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true, -- Set jumps in the jumplist
                    goto_next_start = {
                        ["]m"] = "@function.outer", -- Go to the start of the next function
                        ["]c"] = "@class.outer", -- Go to the start of the next class
                    },
                    goto_next_end = {
                        ["]M"] = "@function.outer", -- Go to the end of the next function
                        ["]C"] = "@class.outer", -- Go to the end of the next class
                    },
                    goto_previous_start = {
                        ["[m"] = "@function.outer", -- Go to the start of the previous function
                        ["[c"] = "@class.outer", -- Go to the start of the previous class
                    },
                    goto_previous_end = {
                        ["[M"] = "@function.outer", -- Go to the end of the previous function
                        ["[C"] = "@class.outer", -- Go to the end of the previous class
                    },
                },
            },

        })
    end,
}
