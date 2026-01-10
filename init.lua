vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.opt.scrolloff = 2

vim.opt.number = true
vim.opt.relativenumber = true

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { import = "plugins" }
  },
  checker = { enabled = true },
})

vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = 'Fast Close' })
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Fast Save' })
vim.keymap.set('n', '<leader>wq', ':wq<CR>', { desc = 'Fast Save and Close' })

vim.keymap.set('n', '<leader>ri', function()
  local view = vim.fn.winsaveview()
  vim.cmd("normal! gg=G")
  vim.fn.winrestview(view)
  print("Re-indented file!")
end, { desc = 'Re-indent file' })

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = "Read error message" })
vim.keymap.set('n', ',d', vim.diagnostic.goto_prev, { desc = "Go to previous error" })
vim.keymap.set('n', '.d', vim.diagnostic.goto_next, { desc = "Go to next error" })
