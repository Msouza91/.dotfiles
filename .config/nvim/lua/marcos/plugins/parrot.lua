return {
	"frankroeder/parrot.nvim",
	--dependencies = { "fzf-lua", "plenary" },
	config = function()
		require("parrot").setup({
			providers = {
				pplx = {
					api_key = { "gpg", "--decrypt", vim.fn.expand("$HOME") .. "/.password-store/Nvim/pplx.gpg" },
					-- OPTIONAL
					-- gpg command
					-- api_key = { "gpg", "--decrypt", vim.fn.expand("$HOME") .. "/pplx_api_key.txt.gpg"  },
					-- macOS security tool
					-- api_key = { "/usr/bin/security", "find-generic-password", "-s pplx-api-key", "-w" },
				},
				openai = {
					api_key = { "gpg", "--decrypt", vim.fn.expand("$HOME") .. "/.password-store/Nvim/ChatGPT.gpg" },
				},
				--[[
					 [anthropic = {
					 [  api_key = os.getenv("ANTHROPIC_API_KEY"),
					 [},
           ]]
			},
		})
	end,
}
