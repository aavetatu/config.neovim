return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			suggestion = {
				enabled = true,
				auto_trigger = true,
				keymap = {
					accept = "<C-t>",
					next = "<C-f>",
					prev = "<C-w>",
					dismiss = "<C-g>",
				},
			},
			panel = { enabled = true },
		})
	end,
}
