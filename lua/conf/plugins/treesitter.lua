local ts = require("nvim-treesitter")

if vim.fn.executable("clang") == 1 then
  vim.env.CC = vim.env.CC or "clang"
end

ts.install({
  "c",
  "cpp",
  "python",
  "html",
  "css",
  "javascript",
  "lua",
  "vim",
  "vimdoc",
  "query",
  "markdown",
  "markdown_inline",
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
    if type(ts.indentexpr) == "function" then
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
