return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "go", "python", "latex" },
			auto_install = true,
			highlight = {
				enable = true,
			},
			build = ":TSUpdate"
		})
	end,
}
