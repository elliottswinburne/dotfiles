local map = vim.keymap.set
local opts = { silent = true }

-- space as leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- disable space in normal and visual modes
map({ "n", "v" }, "<Space>", "<Nop>", opts)

-- window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- file explorer (netrw) toggle
map("n", "<leader>e", function()
  vim.cmd(vim.bo.filetype == "netrw" and "Rexplore" or "Explore")
end, opts)

-- editor actions
map("n", "<leader>w", "<cmd>write<CR>", opts)
map("n", "<leader>q", "<cmd>bdelete<CR>", opts)
map("n", "K", vim.lsp.buf.hover, opts)
map("n", "[d", vim.diagnostic.goto_prev, opts)
map("n", "]d", vim.diagnostic.goto_next, opts)
map("n", "gd", vim.lsp.buf.definition, opts)
map("n", "gD", vim.lsp.buf.declaration, opts)

-- window resize arrow keys
map("n", "<C-Up>", "<cmd>resize +1<CR>", opts)
map("n", "<C-Down>", "<cmd>resize -1<CR>", opts)
map("n", "<C-Left>", "<cmd>vertical resize -1<CR>", opts)
map("n", "<C-Right>", "<cmd>vertical resize +1<CR>", opts)

-- navigate buffers
map("n", "<S-l>", "<cmd>bnext<CR>", opts)
map("n", "<S-h>", "<cmd>bprevious<CR>", opts)

-- accidentally pressing 'Q'
map("n", "Q", "<nop>", opts)
map("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)

-- keep selection after indent
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- visual mode
map("x", "<A-j>", ":move '>+1<CR>gv=gv", opts)
map("x", "<A-k>", ":move '<-2<CR>gv=gv", opts)
map("x", "p", '"_dP', opts)

--terminal navigation
map("t", "<C-h>", "<C-\\><C-N><C-w>h", opts)
map("t", "<C-j>", "<C-\\><C-N><C-w>j", opts)
map("t", "<C-k>", "<C-\\><C-N><C-w>k", opts)
map("t", "<C-l>", "<C-\\><C-N><C-w>l", opts)
