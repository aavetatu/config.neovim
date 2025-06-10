return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright" },
      })

      local lspconfig = require("lspconfig")
      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.fn.stdpath("config"),
                  vim.fn.stdpath("data") .. "/lazy/*",
                  vim.api.nvim_get_runtime_file("", true),
                },
              },
              telemetry = { enable = false },
            },
          },
        },
        pyright = {},
      }

      for name, config in pairs(servers) do
        lspconfig[name].setup(config)
      end
    end,
  },
}
