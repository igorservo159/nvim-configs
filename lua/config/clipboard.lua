-- Copy from neovim to windows
vim.o.clipboard = ""

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		-- only yank
		if vim.v.event.operator ~= "y" then
			return
		end

		-- ignores explict registers + or *
		if vim.v.event.regname == "+" or vim.v.event.regname == "*" then
			return
		end

		-- send to system clipboard
		vim.fn.setreg("+", vim.fn.getreg('"'))
	end,
})

vim.g.clipboard = {
	name = "WslClipboard",
	copy = {
		["+"] = "clip.exe",
		["*"] = "clip.exe",
	},
	paste = {
		["+"] = function()
			return ""
		end,
		["*"] = function()
			return ""
		end,
	},
}
