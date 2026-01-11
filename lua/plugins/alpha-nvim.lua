return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			" ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
			" ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
			" ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
			" ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
			" ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
			" ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
			"",
			"        ⚡ Neovim Ready ⚡",
			"",
		}

		dashboard.section.buttons.val = {
			dashboard.button("SPC n t", "󰙅  Open Neo-tree", "<cmd>Neotree toggle<CR>"),
			dashboard.button("SPC f f", "󰱼  Search file (Telescope)", "<cmd>Telescope find_files<CR>"),
			dashboard.button("SPC f g", "󰱼  Find text (Live Grep)", "<cmd>Telescope live_grep<CR>"),
			dashboard.button("q", "󰗼  Quit Neovim", "<cmd>qa<CR>"),
		}

		dashboard.config.opts.noautocmd = true
		alpha.setup(dashboard.config)
	end,
}
