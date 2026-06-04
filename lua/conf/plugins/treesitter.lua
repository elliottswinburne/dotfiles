-- nvim-treesitter `main` branch (the rewrite, required for Neovim 0.12+).
-- The old `require("nvim-treesitter.configs").setup{}` API no longer exists.
local ts = require("nvim-treesitter")

-- Transition guard: if the plugin on disk is still the `master` branch
-- (e.g. before `:lua vim.pack.update()` has switched it), `install` won't
-- exist. Bail out quietly instead of throwing and aborting the rest of init.
if type(ts.install) ~= "function" then
  vim.notify(
    "nvim-treesitter still on master; run :lua vim.pack.update() then restart",
    vim.log.levels.WARN
  )
  return
end

-- Parsers to install. install() is asynchronous; parsers land in
-- stdpath("data")/site/parser. Run :TSUpdate later to update them.
ts.install({
  "c",
  "cpp",
  "python",
  "html",
  "css",
  "matlab",
  "javascript",
  "lua",
  "vim",
  "vimdoc",
  "query",
  "markdown",
  "markdown_inline",
})

-- The `main` branch does NOT enable highlighting automatically. Start
-- treesitter per-buffer for any filetype that has an installed parser.
vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    -- vim.treesitter.start() picks the parser from the buffer's filetype;
    -- pcall keeps filetypes without a parser from raising errors.
    if not pcall(vim.treesitter.start, args.buf) then
      return
    end

    -- Experimental treesitter-based indentation (guarded: only if the
    -- installed version exposes it).
    if type(ts.indentexpr) == "function" then
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
