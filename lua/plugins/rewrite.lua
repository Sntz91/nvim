return{
	-- {dir="/home/ziegleto/projects/sentence-rewriting.nvim"},
	"sntz91/sentence-rewriting.nvim",
	config = function()
		local rewrite = require("rewrite")
		local opts = {
			server = "192.168.178.67:11434"
		}
		rewrite.setup(opts)
	end
}
