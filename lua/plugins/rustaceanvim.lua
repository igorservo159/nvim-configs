return {
	"mrcjkb/rustaceanvim",
	dependencies = {
		"saghen/blink.cmp",
	},
	version = "^6",
	lazy = false,
	config = function()
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		vim.g.rustaceanvim = {
			server = {
				capabilities = capabilities,
				on_attach = function(client, bufnr) end,
				default_settings = {
					["rust-analyzer"] = {
						checkOnSave = {
							command = "clippy",
						},
					},
				},
			},
		}
	end,
}
