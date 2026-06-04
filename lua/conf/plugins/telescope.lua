require("telescope").setup({})

local builtin = require("telescope.builtin")

-- file finding
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fh", ":Telescope find_files hidden=true <CR>", { desc = "Find hidden files" })
vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })

-- search
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Search by grep" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Search current word" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Search diagnostics" })

-- git
vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Git files" })
vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Git commits" })
vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Git branches" })
vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Git status" })

-- buffers & nav
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find keymaps" })
vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "Find commands" })

-- lsp
vim.keymap.set("n", "<leader>ls", builtin.lsp_document_symbols, { desc = "Document symbols" })
vim.keymap.set("n", "<leader>lr", builtin.lsp_references, { desc = "LSP references" })

-- help
vim.keymap.set("n", "<leader>hh", builtin.help_tags, { desc = "Help tags" })
vim.keymap.set("n", "<leader>hm", builtin.man_pages, { desc = "Man pages" })
