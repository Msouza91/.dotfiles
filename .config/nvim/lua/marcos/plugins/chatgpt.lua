return {
	"dreamsofcode-io/ChatGPT.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("chatgpt").setup({
			async_api_key_cmd = "pass Nvim/ChatGPT",
			predefined_chat_gpt_prompts = "https://raw.githubusercontent.com/Msouza91/gpt-prompts/main/prompts.csv",
		})
	end,
}
