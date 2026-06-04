require("oil").setup({
  default_file_explorer = true,
  columns = {
    "icon",
  },
  view_options = {
    show_hidden = true,
  },
  float = {
    padding = 2,
    max_width = 90,
    max_height = 30,
    border = "rounded",
    win_options = {
      winblend = 0,
    },
  },
})

vim.keymap.set("n", "<leader>e", function()
  require("oil").open_float()
end, { desc = "Open file explorer" })
