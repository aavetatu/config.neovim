require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "lua", "vim", "bash", "json", "html", "css", "javascript", "typescript",
    "python", "c", "cpp", "markdown", "markdown_inline", "java",
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
})

