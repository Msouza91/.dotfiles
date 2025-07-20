local M = {}

function M.setup_cmp()
	local cmp = require("cmp")
	local cmp_action = require("lsp-zero").cmp_action()
	local lspkind = require("lspkind")
	local has_words_before = function()
		if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
			return false
		end
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
	end
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
				mode = "symbol",
				maxwidth = 50,
				ellipsis_char = "...",
				show_labelDetails = true,
				symbol_map = { Copilot = "" },
			}),
		},
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
		mapping = {
			["<Tab>"] = vim.schedule_wrap(function(fallback)
				if cmp.visible() and has_words_before() then
					cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
				else
					fallback()
				end
			end),
			["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
			["<C-e>"] = cmp.mapping.close(),
			["<C-y>"] = cmp.mapping.confirm({ select = false }),
			["<C-u>"] = cmp.mapping.scroll_docs(-4),
			["<C-d>"] = cmp.mapping.scroll_docs(4),
			["<C-n>"] = cmp_action.luasnip_supertab(),
			["<C-p>"] = cmp_action.luasnip_shift_supertab(),
		},
		sources = {
			{ name = "copilot" },
			{ name = "nvim_lsp" },
			{ name = "luasnip", keyword_length = 2 },
			{ name = "buffer", keyword_length = 3 },
			{ name = "path" },
			{ name = "nvim_lua" },
		},
		sorting = {
			priority_weight = 2,
			comparators = {
				require("copilot_cmp.comparators").prioritize,
				cmp.config.compare.offset,
				cmp.config.compare.exact,
				cmp.config.compare.score,
				cmp.config.compare.recently_used,
				cmp.config.compare.locality,
				cmp.config.compare.kind,
				cmp.config.compare.sort_text,
				cmp.config.compare.length,
				cmp.config.compare.order,
			},
		},
	})
end

return M
