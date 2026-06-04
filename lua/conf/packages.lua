local gh = function(repo)
  return "https://github.com/" .. repo
end

vim.pack.add({
  gh("Mofiqul/dracula.nvim"),
  gh("nvim-tree/nvim-web-devicons"),
  gh("stevearc/oil.nvim"),
  { src = gh("nvim-telescope/telescope.nvim"), version = "0.1.8" },
  gh("nvim-lua/plenary.nvim"),
  { src = gh("nvim-treesitter/nvim-treesitter"), version = "main" },
  gh("altermo/ultimate-autopair.nvim"),
  gh("neovim/nvim-lspconfig"),
  gh("williamboman/mason.nvim"),
  gh("williamboman/mason-lspconfig.nvim"),
  gh("hrsh7th/cmp-nvim-lsp"),
  gh("hrsh7th/nvim-cmp"),
}, { confirm = false })
