return {
	"vim-test/vim-test",
	lazy = false,
	init = function()
		-- Set the test strategy for neovim
		vim.g["test#strategy"] = "vimux"
	end,
	dependencies = { "preservim/vimux" },
	config = function()
		-- Key mappings for running tests
		local keymap = vim.keymap.set
		local opts = { noremap = true, silent = true }

		-- Run nearest test to cursor
		keymap("n", "<leader>tn", ":TestNearest<CR>", opts)

		-- Run all tests in the current file
		keymap("n", "<leader>tf", ":TestFile<CR>", opts)

		-- Run the entire test suite
		keymap("n", "<leader>ts", ":TestSuite<CR>", opts)

		-- Re-run the last test
		keymap("n", "<leader>tl", ":TestLast<CR>", opts)

		-- Open the last test file visited
		keymap("n", "<leader>tv", ":TestVisit<CR>", opts)
	end,
}
