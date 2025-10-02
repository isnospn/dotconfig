return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "nvim-neotest/nvim-nio",           -- required by nvim-dap-ui
      "rcarriga/nvim-dap-ui",            -- UI panels
      "theHamsta/nvim-dap-virtual-text", -- inline variable values
      "mxsdev/nvim-dap-vscode-js",       -- JS/TS adapter
    },
    config = function()
      local dap, dapui = require("dap"), require("dapui")

      -- =========================
      -- 🔹 UI setup
      -- =========================
      dapui.setup()
      require("nvim-dap-virtual-text").setup()

      -- Auto open/close dap-ui
      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

      -- Signs (icons)
      vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticError" })
      vim.fn.sign_define("DapStopped",    { text = "", texthl = "DiagnosticWarn", linehl = "Visual" })

      -- =========================
      -- 🔹 Keymaps
      -- =========================
      vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
      vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debug: Step Over" })
      vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debug: Step Into" })
      vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Debug: Step Out" })
      vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
      vim.keymap.set("n", "<leader>B", function()
        dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end, { desc = "Debug: Conditional Breakpoint" })
      vim.keymap.set("n", "<leader>lp", function()
        dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
      end, { desc = "Debug: Logpoint" })
      vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Debug: Open REPL" })
      vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "Debug: Run Last" })

      -- =========================
      -- 🔹 Python (debugpy)
      -- =========================
      dap.adapters.python = {
        type = "executable",
        command = vim.fn.exepath("python3") or "python",
        args = { "-m", "debugpy.adapter" },
      }
      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          pythonPath = function()
            return vim.fn.exepath("python3") or "python"
          end,
        },
        {
          type = "python",
          request = "launch",
          name = "Launch with arguments",
          program = "${file}",
          args = function()
            local args_string = vim.fn.input("Arguments: ")
            return vim.split(args_string, " +")
          end,
        },
      }

      -- =========================
      -- 🔹 JavaScript / TypeScript (vscode-js-debug)
      -- =========================
      require("dap-vscode-js").setup({
        node_path = "node",
        debugger_path = vim.fn.stdpath("data") .. "/js-debug", -- cloned vscode-js-debug
        adapters = { "pwa-node", "pwa-chrome", "node-terminal" },
      })
      for _, language in ipairs({ "javascript", "typescript" }) do
        dap.configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          },
          {
            type = "pwa-chrome",
            request = "launch",
            name = "Launch Chrome (http://localhost:3000)",
            url = "http://localhost:3000",
            webRoot = "${workspaceFolder}",
          },
        }
      end

      -- =========================
      -- 🔹 C / C++ (codelldb, hardcoded path)
      -- =========================
      local codelldb_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb"

      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = codelldb_path,
          args = { "--port", "${port}" },
        },
      }
      dap.configurations.cpp = {
        {
          name = "Launch",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},
        },
      }
      dap.configurations.c = dap.configurations.cpp
        -- =========================
        -- 🔹 Lua (nlua adapter, for Neovim itself)
        -- =========================
      dap.adapters.nlua = function(callback, config)
        callback({ type = "server", host = config.host or "127.0.0.1", port = config.port })
      end

      dap.configurations.lua = {
        {
          type = "nlua",
          request = "attach",
          name = "Attach to running Neovim instance",
          host = function()
            return "127.0.0.1"
          end,
          port = function()
            return tonumber(vim.fn.input("Port: ", "8086"))
          end,
        },
      }

    end,
  },
}

