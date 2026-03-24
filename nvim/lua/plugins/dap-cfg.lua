return {
	"mfussenegger/nvim-dap",
	dependencies = { "rcarriga/nvim-dap-ui", "theHamsta/nvim-dap-virtual-text", "nvim-neotest/nvim-nio", "mfussenegger/nvim-dap-python" },
	event = "BufReadPost",
	config = function()
		local dap = require("dap")

		-- Debug UI and virtual text
		local dapui = require("dapui")
		local vt = require("nvim-dap-virtual-text")

		dapui.setup()
		vt.setup()

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end

		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end

		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		-- Configuración de Python
		require("dap-python").setup("~/Documentos/Python/debugpy/bin/python3")

		-- Config JS/TS
		dap.adapters["pwa-node"] = {
			type = "server",
			host = "localhost",
			port = "8123",
			executable = {
				command = "node",
				args = { "/home/futuzor/bin/js-debug/src/dapDebugServer.js" },
			}
		}

		for _, language in ipairs({ "typescript", "javascript" }) do
			dap.configurations[language] = {
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					cwd = vim.fn.getcwd(),
					runtimeExecutable = "node",
				},
			}
		end
	end
}
