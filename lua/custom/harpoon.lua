local harpoon = require("harpoon")

harpoon:setup({})

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
	local finder = function()
		local file_paths = {}
		for _, item in ipairs(harpoon_files.items) do
			table.insert(file_paths, item.value)
		end
		return require("telescope.finders").new_table({
			results = file_paths,
		})
	end

	require("telescope.pickers")
		.new({}, {
			prompt_title = "Harpoon",
			finder = finder(),
			previewer = conf.file_previewer({}),
			sorter = conf.generic_sorter({}),
			attach_mappings = function(prompt_buffer_number, map)
				map(
					"i",
					"<C-d>", -- your mapping here
					function()
						local state = require("telescope.actions.state")
						local selected_entry = state.get_selected_entry()
						local current_picker = state.get_current_picker(prompt_buffer_number)

						table.remove(harpoon_files.items, selected_entry.index)
						current_picker:refresh(finder())
					end
				)
				return true
			end,
		})
		:find()
end

vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
end)
vim.keymap.set("n", "<C-t>", function()
	toggle_telescope(harpoon:list())
end, { desc = "Open harpoon window" })

vim.keymap.set("n", "<C-n>", function()
	harpoon:list():select(1)
end)
vim.keymap.set("n", "<C-e>", function()
	harpoon:list():select(2)
end)
vim.keymap.set("n", "<C-i>", function()
	harpoon:list():select(3)
end)
vim.keymap.set("n", "<C-o>", function()
	harpoon:list():select(4)
end)
