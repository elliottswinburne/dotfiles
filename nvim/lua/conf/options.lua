local options = {
	clipboard = "unnamedplus",
	cmdheight = 1,
	completeopt = { "menuone", "noselect" },
	guicursor = "n-v-c-sm:block,i-ci-ve:block,r-cr-o:hor20",
	ignorecase = true,
	pumheight = 10,
	showmode = false,
	showtabline = 2,
	smartcase = true,
	splitbelow = true,
	splitright = true,
	undofile = true,
	updatetime = 300,
	winborder = "rounded",
	expandtab = true,
	shiftwidth = 4,
	tabstop = 4,
	number = true,
	signcolumn = "yes",
	wrap = false,
	scrolloff = 4,
	sidescrolloff = 4,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- open nvim with most recent file, this might break piping into nvim
vim.api.nvim_create_autocmd("VimEnter", {
  nested = true,
  callback = function()
    if vim.fn.argc() > 0 then
      return
    end
    for _, file in ipairs(vim.v.oldfiles) do
      if vim.fn.filereadable(file) == 1 then
        vim.cmd.edit(file)
        return
      end
    end
  end,
})

-- create autocommand group for file-specific settings
vim.api.nvim_create_augroup("FileTypeSpecific", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "html", "css", "javascript", "lua" },
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
	end,
	group = "FileTypeSpecific",
})

vim.cmd("autocmd BufEnter * set formatoptions-=cro")
-- Remove these flags when opening buffers:
-- c - auto wrap comments using the current textwidth
-- r - auto continue a comment when you press Enter in Insert mode
-- o - auto insert the comment leader when using o or O to open a new line

-- if on Windows, use powershell 7
if vim.fn.has("win32") == 1 then
	vim.opt.shell = "pwsh"
	vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
	vim.opt.shellquote = ""
	vim.opt.shellxquote = ""
end
