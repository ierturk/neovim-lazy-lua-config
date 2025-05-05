return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui", -- UI for debugging
            "theHamsta/nvim-dap-virtual-text", -- Inline variable display
            "nvim-neotest/nvim-nio", -- Required dependency for nvim-dap-ui
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            -- Configure LLDB adapter
            dap.adapters.lldb = {
                type = "executable",
                command = "/usr/local/bin/lldb-dap18", -- Replace with the full path to lldb-vscode
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
                    runInTerminal = true, -- Run the app in the integrated terminal
                },
            }

            -- Use the same configuration for C
            dap.configurations.c = dap.configurations.cpp

            -- Configure DAP UI
            dapui.setup({
                layouts = {
                    {
                        elements = {
                            { id = "scopes", size = 0.25 },
                            { id = "breakpoints", size = 0.25 },
                            { id = "stacks", size = 0.25 },
                            { id = "watches", size = 0.25 },
                        },
                        size = 40, -- Width of the DAP UI window
                        position = "left", -- Position of the DAP UI window
                    },
                    {
                        elements = {
                            { id = "repl", size = 0.5 },
                            { id = "console", size = 0.5 },
                        },
                        size = 10, -- Height of the DAP UI window
                        position = "bottom", -- Position of the DAP UI window
                    },
                },
            })

            -- Automatically open/close DAP UI
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            -- Configure nvim-dap-virtual-text
            require("nvim-dap-virtual-text").setup({
                enabled = true, -- Automatically enable virtual text
                enabled_commands = true, -- Enable commands like DapVirtualTextEnable
                highlight_changed_variables = true, -- Highlight variables that have changed
                highlight_new_as_changed = true, -- Highlight new variables as changed
                show_stop_reason = true, -- Show the reason why the debugger stopped
                commented = false, -- Do not prefix virtual text with comments
            })

            -- Keybindings for debugging
            vim.keymap.set("n", "<F5>", function() dap.continue() end, { desc = "Start/Continue Debugging" })
            vim.keymap.set("n", "<F10>", function() dap.step_over() end, { desc = "Step Over" })
            vim.keymap.set("n", "<F11>", function() dap.step_into() end, { desc = "Step Into" })
            vim.keymap.set("n", "<F12>", function() dap.step_out() end, { desc = "Step Out" })
            vim.keymap.set("n", "<Leader>b", function() dap.toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
            vim.keymap.set("n", "<Leader>B", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, { desc = "Set Conditional Breakpoint" })
            vim.keymap.set("n", "<Leader>dr", function() dap.repl.open() end, { desc = "Open REPL" })
            vim.keymap.set("n", "<Leader>dl", function() dap.run_last() end, { desc = "Run Last Debugging Session" })
            vim.keymap.set("n", "<Leader>du", function() dapui.toggle() end, { desc = "Toggle DAP UI" })
            vim.keymap.set("n", "<Leader>dv", ":DapVirtualTextToggle<CR>", { desc = "Toggle DAP Virtual Text" })
        end,
    },
}
