return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"mason-org/mason-lspconfig.nvim",
				opts = {
					automatic_enable = true,
				},
			},
			{
				"mason-org/mason.nvim",
				opts = {},
			},
			"folke/lazydev.nvim",
		},
		config = function()
			vim.opt.completeopt = { "menu", "menuone", "noselect" }
			vim.opt.pumheight = 5

			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LspAttach Actions (keymaps, autocomplete)",
				group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if not client then
						return
					end

					local opts = { buffer = args.buf, noremap = true, silent = true }

					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

					if client:supports_method("textDocument/completion") then
						vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
					end
				end,
			})

			vim.lsp.enable("lua_ls")
			vim.lsp.enable("clangd")
			vim.lsp.enable("pyright")
		end,
	},
}
