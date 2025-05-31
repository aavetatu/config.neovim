require("neo-tree").setup({
  window = {
  mappings = {
    ["P"] = {
      "toggle_preview",
      config = {
        use_float = true,
      },
      },
    }
  }
})

vim.keymap.set("n", "<leader>nt", vim.cmd.Neotree)
