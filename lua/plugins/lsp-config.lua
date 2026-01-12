return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"mason-org/mason.nvim",
				opts = {},
			},
			{
				"mason-org/mason-lspconfig.nvim",
				opts = {
					automatic_installation = true,
				},
			},
			"folke/lazydev.nvim",
			"saghen/blink.cmp",
		},

		config = function()
			-- 🔹 LspAttach: keymaps (inalterado)
			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LspAttach Actions (keymaps)",
				group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
				callback = function(args)
					local opts = { buffer = args.buf, noremap = true, silent = true }

					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				end,
			})

			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local servers = { "lua_ls", "clangd", "pyright" }

			for _, server in ipairs(servers) do
				vim.lsp.config(server, {
					capabilities = capabilities,
				})

				vim.lsp.enable(server)
			end
		end,
	},
}
