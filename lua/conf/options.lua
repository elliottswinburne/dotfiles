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

vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

-- reload buffers automatically
vim.api.nvim_create_augroup("AutoReadFile", { clear = true })

vim.api.nvim_create_autocmd(
	{ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI", "TermClose", "TermLeave" },
	{
		group = "AutoReadFile",
		pattern = "*",
		callback = function()
			if vim.fn.mode() ~= "c" and vim.fn.getcmdwintype() == "" then
				vim.cmd("checktime")
			end
		end,
	}
)

-- notify when a buffer was reloaded from disk
vim.api.nvim_create_autocmd("FileChangedShellPost", {
	group = "AutoReadFile",
	pattern = "*",
	callback = function()
		vim.notify("File changed on disk — buffer reloaded", vim.log.levels.WARN)
	end,
})

vim.opt.shortmess:append "c"

vim.opt.guifont = "Google Sans Code:h11"

if vim.fn.has("win32") == 1 then
	vim.opt.shell = "powershell.exe"
	vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
	vim.opt.shellquote = ""
	vim.opt.shellxquote = ""
end
