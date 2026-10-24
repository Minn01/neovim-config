return {
	{
		"CRAG666/code_runner.nvim",
		cmd = { "RunCode", "RunFile", "RunProject", "RunClose" },
        config = function()
            require("code_runner").setup({
                filetype = {
                    python = "python3 -u",
                    java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
                    javascript = "node",
                    rust = "cd $dir && cargo run"
                },
            })
        end
    }
}
