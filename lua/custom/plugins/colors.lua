return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			background = {
				dark = "mocha",
			},
			dim_inactive = {
				enabled = true,
				shade = "light",
				percentage = 0.15,
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
