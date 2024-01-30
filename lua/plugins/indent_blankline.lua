return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {},
	config = function()
		local ibl = require("ibl")
		local highlight = {
			"CursorColumn",
			"Whitespace",
		}
		ibl.setup({
			indent = { highlight = highlight, char = "" },
			whitespace = {
				highlight = highlight,
				remove_blankline_trail = false,
			},
			scope = { enabled = false },
		})
	end,
}
