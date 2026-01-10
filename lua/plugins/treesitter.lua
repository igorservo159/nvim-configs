return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  opts = {
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "html", "rust", "python"},
    auto_install = true,
    highlight = {
      enable = true
    },
    indent = {
      enable = true
    }
  }
}
