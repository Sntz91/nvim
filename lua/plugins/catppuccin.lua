return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		term_colors = true,
		transparent_background = true,
	},
	lazy = false,
	config = function()
		vim.cmd.colorscheme("catppuccin")
	end
}
