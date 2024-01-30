return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local lualine = require("lualine")
		lualine.setup({
			options = {
				icons_enabled = true,
				section_separators = "",
				component_separators = "",
			},
		})
	end,
}
