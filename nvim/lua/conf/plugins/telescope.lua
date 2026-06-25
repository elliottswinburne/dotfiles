require("telescope").setup({
  defaults = {
    preview = { treesitter = false },
    disable_devicons = true,
  },
})

local map = vim.keymap.set
local builtin = require("telescope.builtin")

-- file finding
map("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
map("n", "<leader>fh", function() builtin.find_files({ hidden = true }) end, { desc = "Find hidden files" })
map("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })

-- search (require ripgrep on PATH)
map("n", "<leader>sg", builtin.live_grep, { desc = "Search by grep" })
map("n", "<leader>sw", builtin.grep_string, { desc = "Search current word" })
map("n", "<leader>sd", builtin.diagnostics, { desc = "Search diagnostics" })

-- git
map("n", "<leader>gf", builtin.git_files, { desc = "Git files" })
map("n", "<leader>gc", builtin.git_commits, { desc = "Git commits" })
map("n", "<leader>gb", builtin.git_branches, { desc = "Git branches" })
map("n", "<leader>gs", builtin.git_status, { desc = "Git status" })

-- buffers & nav
map("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
map("n", "<leader>fk", builtin.keymaps, { desc = "Find keymaps" })
map("n", "<leader>fc", builtin.commands, { desc = "Find commands" })

-- lsp
map("n", "<leader>ls", builtin.lsp_document_symbols, { desc = "Document symbols" })
map("n", "<leader>lr", builtin.lsp_references, { desc = "LSP references" })

-- help
map("n", "<leader>hh", builtin.help_tags, { desc = "Help tags" })
