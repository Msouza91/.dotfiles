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
		-- Globals
		vim.g.lsp_ui_float_border = "none"
		local lsp = require("lsp-zero")

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
			},
		})

		--- Setup cmp completion
		local cmp = require("cmp")
		local cmp_action = require("lsp-zero").cmp_action()
		local types = require("cmp.types")
		local str = require("cmp.utils.str")
		local lspkind = require("lspkind")
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
				{ name = "cmdline" },
				option = {
					ignore_cmds = { "Man", "!" },
				},
			}),
		})

		cmp.setup({
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol", -- show only symbol annotations
					maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
					-- can also be a function to dynamically calculate max width such as
					-- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
					ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
					show_labelDetails = true, -- show labelDetails in menu. Disabled by default
					symbol_map = { Supermaven = "" },
				}),
			},
			snipet = {
				expand = function(args)
					require("luasnip").lsp.expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.close(),
				["<C-y>"] = cmp.mapping.confirm({ select = false }),
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
				["<C-n>"] = cmp_action.luasnip_supertab(),
				["<C-p>"] = cmp_action.luasnip_shift_supertab(),
			}),
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip", keyword_length = 2 },
				{ name = "buffer", keyword_length = 3 },
				{ name = "path" },
				{ name = "nvim_lua" },
				{ name = "supermaven" },
			},
		})

		--- Setup Mapping and some prferences
		lsp.set_preferences({
			suggest_lsp_servers = false,
			sign_icons = {
				error = "E",
				warn = "W",
				hint = "H",
				info = "I",
			},
		})

		lsp.on_attach(function(client, bufnr)
			local opts = { buffer = bufnr, remap = false }

			if client.server_capabilities["documentSymbolProvider"] then
				require("nvim-navic").attach(client, bufnr)
			end

			vim.keymap.set("n", "gd", function()
				vim.lsp.buf.definition()
			end, opts)
			vim.keymap.set("n", "gD", function()
				vim.lsp.buf.declaration()
			end, opts)
			vim.keymap.set("n", "gi", function()
				vim.lsp.buf.implementation()
			end, opts)
			vim.keymap.set("n", "<leader>D", function()
				vim.lsp.buf.type_definition()
			end, opts)
			vim.keymap.set("n", "K", function()
				vim.lsp.buf.hover()
			end, opts)
			vim.keymap.set("n", "<leader>vws", function()
				vim.lsp.buf.workspace_symbol()
			end, opts)
			vim.keymap.set("n", "<leader>vd", function()
				vim.diagnostic.open_float()
			end, opts)
			vim.keymap.set("n", "[d", function()
				vim.diagnostic.goto_next()
			end, opts)
			vim.keymap.set("n", "]d", function()
				vim.diagnostic.goto_prev()
			end, opts)
			vim.keymap.set("n", "<leader>vca", function()
				vim.lsp.buf.code_action()
			end, opts)
			vim.keymap.set("n", "<leader>vrr", function()
				vim.lsp.buf.references()
			end, opts)
			vim.keymap.set("n", "<leader>vrn", function()
				vim.lsp.buf.rename()
			end, opts)
			vim.keymap.set("i", "<C-h>", function()
				vim.lsp.buf.signature_help()
			end, opts)
		end)

		lsp.setup()

		vim.diagnostic.config({
			virtual_text = true,
		})
	end,
}
