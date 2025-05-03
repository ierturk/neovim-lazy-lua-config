return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        -- Optional: Add any fzf-lua-specific configuration here
        winopts = {
            height = 0.5, -- window height
            width = 0.8,  -- window width
        },
        fzf_opts = {
            ['--layout'] = 'reverse', -- reverse layout
        },
    },
    config = function(_, opts)
        -- Load fzf-lua with the provided options
        require("fzf-lua").setup(opts)

        -- Override vim.ui.select to use fzf-lua
        vim.ui.select = function(items, opts, on_choice)
            require("fzf-lua").fzf_select({
                source = items,
                prompt = opts.prompt or '',
                format_item = opts.format_item,
            }, on_choice)
        end
    end,
}
