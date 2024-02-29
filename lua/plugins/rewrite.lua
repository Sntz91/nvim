return{
	-- {dir="/home/ziegleto/Projects/sentence-rewriting.nvim"},
	"sntz91/sentence-rewriting.nvim",
	config = function()
		local rewrite = require("rewrite")
		rewrite.setup()
	end
}
