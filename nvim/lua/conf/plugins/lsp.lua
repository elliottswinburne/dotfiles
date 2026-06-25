-- lsp keymaps on attach
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = function(event)
    local opts = { buffer = event.buf }
    vim.keymap.set("n", "<leader>k", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, opts)
  end,
})

-- shared lsp client capabilities
vim.lsp.config("*", {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

-- lua language server settings
vim.lsp.config("lua_ls", {
  settings = { Lua = { diagnostics = { globals = { "vim" } } } }
})

-- use msys2 clangd instead of mason clangd
vim.lsp.config("clangd", {
  cmd = { "C:/msys64/ucrt64/bin/clangd.exe" }
})
vim.lsp.enable("clangd")

-- mason installs and auto-enables managed servers
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "pyright", "html" },
})

-- completion
local cmp = require("cmp")

cmp.setup({
  -- use lsp completion source
  sources = { { name = "nvim_lsp" } },

  -- expand completion snippets with neovim snippets
  snippet = {
    expand = function(args) vim.snippet.expand(args.body) end,
  },

  -- completion menu keymaps
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping.scroll_docs(-1),
    ["<C-f>"] = cmp.mapping.scroll_docs(1),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then cmp.select_next_item() else fallback() end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then cmp.select_prev_item() else fallback() end
    end, { "i", "s" }),
  },

  -- disable icons in completion menu
  formatting = {
    fields = { "abbr" },
  },
})
