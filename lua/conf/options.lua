local options = {
  autoread = true,
	backup = false,
	clipboard = "unnamedplus",
	cmdheight = 2,
	completeopt = { "menuone", "noselect" },
	conceallevel = 0,
	fileencoding = "utf-8",
	hlsearch = true,
	incsearch = true,
	ignorecase = true,
	ro = false,
	mouse = "a",
	pumheight = 10,
	showmode = false,
	showtabline = 2,
	smartcase = true,
	splitbelow = true,
	splitright = true,
	swapfile = false,
	termguicolors = true,
	timeoutlen = 1000,
	undofile = true,
	updatetime = 300,
	writebackup = false,
	expandtab = true,
	shiftwidth = 4,
	tabstop = 4,
	cursorline = false,
	number = true,
	numberwidth = 4,
	signcolumn = "yes",
	wrap = false,
	scrolloff = 4,
	sidescrolloff = 4,
  guifont = "Google Sans Code"
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

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

vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")
-- c - auto wrap comments using the current textwidth
-- r - auto continue a comment when you press Enter in Insert mode
-- o - auto insert the comment leader when using o or O to open a new line

vim.opt.shortmess:append "c"

if vim.fn.has("win32") == 1 then
	vim.opt.shell = "powershell.exe"
	vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
	vim.opt.shellquote = ""
	vim.opt.shellxquote = ""
end

-- transparent bg
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
