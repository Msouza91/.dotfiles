return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		-- LSP Support
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		-- Autocompletion
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",

		-- Snippets
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",

		-- Format Symbols
		"onsails/lspkind.nvim",
	},
	config = function()
		local my_handlers = require("marcos.core.handlers")
		local cmp_setup = require("marcos.lsp.cmp")

		-- Globals
		vim.g.lsp_ui_float_border = "none"
		local lsp = require("lsp-zero")
		local capabilities = lsp.get_capabilities()

		lsp.preset("recommended")

		--- Setup Mason LSP Install
		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = {
				"terraformls",
				"tflint",
				"gopls",
				"yamlls",
				"lua_ls",
				"azure_pipelines_ls@0.7.0",
				"eslint",
				"dockerls",
				"docker_compose_language_service",
				"bashls",
				"taplo",
			},
			handlers = {
				lsp.default_setup,
				lua_ls = function()
					local lua_opts = lsp.nvim_lua_ls()
					require("lspconfig").lua_ls.setup(lua_opts)
				end,
				azure_pipelines_ls = function()
					require("lspconfig").azure_pipelines_ls.setup(my_handlers.azure())
				end,
			},
		})
		require("mason-tool-installer").setup({
			ensure_installed = {
				"stylua",
				"prettier",
				"hadolint",
				"eslint_d",
				"tfsec",
				"gofumpt",
				"revive",
				"markdownlint",
				"nixpkgs-fmt",
			},
		})

		cmp_setup.setup_cmp()

		--- Setup Mapping and some prferences
		lsp.set_preferences({
			suggest_lsp_servers = false,
			sign_icons = {
				ERROR = "",
				WARN = "",
				HINT = "",
				INFO = "",
			},
		})

		lsp.on_attach(function(client, bufnr)
			local set = vim.keymap.set
			local opts = { buffer = bufnr, remap = false }

			if client.server_capabilities["documentSymbolProvider"] then
				require("nvim-navic").attach(client, bufnr)
			end

			set("n", "gd", function()
				vim.lsp.buf.definition()
			end, opts)
			set("n", "gD", function()
				vim.lsp.buf.declaration()
			end, opts)
			set("n", "gi", function()
				vim.lsp.buf.implementation()
			end, opts)
			set("n", "<leader>D", function()
				vim.lsp.buf.type_definition()
			end, opts)
			set("n", "K", function()
				vim.lsp.buf.hover()
			end, opts)
			set("n", "<leader>vws", function()
				vim.lsp.buf.workspace_symbol()
			end, opts)
			set("n", "<leader>vd", function()
				vim.diagnostic.open_float()
			end, opts)
			set("n", "[d", function()
				vim.diagnostic.goto_next()
			end, opts)
			set("n", "]d", function()
				vim.diagnostic.goto_prev()
			end, opts)
			set("n", "<leader>vca", function()
				vim.lsp.buf.code_action()
			end, opts)
			set("n", "<leader>vrr", function()
				vim.lsp.buf.references()
			end, opts)
			set("n", "<leader>vrn", function()
				vim.lsp.buf.rename()
			end, opts)
			set("i", "<C-h>", function()
				vim.lsp.buf.signature_help()
			end, opts)
		end)

		lsp.setup()

		vim.diagnostic.config({
			virtual_text = false,
		})
	end,
}
