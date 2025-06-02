return {
 {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    lazy = false,

    config = function()
    
      require("neo-tree").setup({
        close_if_last_window = true, 
        window = {
          position = "right",
          width = 50,
        },
        enable_git_status = true,
        name = {
          use_git_status_colors = true,
        },
  })
      vim.keymap.set("n", "<leader>t", "<Cmd>Neotree reveal<CR>")
    end,
  },
}
