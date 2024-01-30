return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			-- opened files
			vim.keymap.set("n", "<leader><space>", "<cmd>Telescope buffers<cr>")
			-- recently opened files
			vim.keymap.set("n", "<leader>?", "<cmd>Telescope oldfiles<cr>")
			-- search in cwd
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			-- search for pattern in all files cwd
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			-- pettern in this file
			vim.keymap.set("n", "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find<cr>")
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
