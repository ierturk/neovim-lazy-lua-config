return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui", -- Optional: UI for debugging
            "theHamsta/nvim-dap-virtual-text", -- Optional: Inline variable display
            "nvim-neotest/nvim-nio", -- Required dependency for nvim-dap-ui
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            -- Configure LLDB adapter
            dap.adapters.lldb = {
                type = "executable",
                command = "/usr/local/bin/lldb-dap18", -- Replace with the full path to lldb-vscode17
                name = "lldb",
            }

            -- Configure C++ debugging
            dap.configurations.cpp = {
                {
                    name = "Launch C++ file",
                    type = "lldb", -- Matches the adapter name
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/main", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = true,
                    args = {}, -- Add program arguments here if needed
                },
            }

            -- Optional: Configure UI
            dapui.setup()
            require("nvim-dap-virtual-text").setup()

            -- Keybindings for debugging
            vim.keymap.set("n", "<F5>", function() dap.continue() end, { desc = "Start/Continue Debugging" })
            vim.keymap.set("n", "<F10>", function() dap.step_over() end, { desc = "Step Over" })
            vim.keymap.set("n", "<F11>", function() dap.step_into() end, { desc = "Step Into" })
            vim.keymap.set("n", "<F12>", function() dap.step_out() end, { desc = "Step Out" })
            vim.keymap.set("n", "<Leader>b", function() dap.toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
            vim.keymap.set("n", "<Leader>B", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, { desc = "Set Conditional Breakpoint" })
            vim.keymap.set("n", "<Leader>dr", function() dap.repl.open() end, { desc = "Open REPL" })
            vim.keymap.set("n", "<Leader>dl", function() dap.run_last() end, { desc = "Run Last Debugging Session" })
        end,
    },
}
