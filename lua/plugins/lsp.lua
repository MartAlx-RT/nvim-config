has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

return {
	{ 
		"neovim/nvim-lspconfig",
		config = function() 
			-- require('lspconfig').clangd.setup{}
			-- require('lspconfig').virtua_text = true
		end
	},
	{
		"hrsh7th/nvim-cmp",
		-- event = "InsertEnter",
		lazy = false,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
		},
		config = function()
			local cmp = require('cmp')
			cmp.setup({
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-U>'] = cmp.mapping.abort(),
					['<C-p>'] = cmp.mapping.confirm({ select = true }),
					['<C-N>'] = function(fallback)
						if not cmp.select_next_item() then
							if vim.bo.buftype ~= 'prompt' and has_words_before() then
							-- if vim.bo.buftype ~= 'prompt' then
								cmp.complete()
							else
								fallback()
							end
						end
					end,
				}),
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
				}, {
					{ name = 'buffer' }
				})
			})
		capabilities = require('cmp_nvim_lsp').default_capabilities()
		--	require('lspconfig').clangd.setup {
		--		capabilities = capabilities
		--	}
		--	require('lspconfig').pyright.setup {
		--		capabilities = capabilities
		--	}

		vim.lsp.config('clangd', {
		  capabilities = capabilities
		})
		vim.lsp.enable('clangd')

		-- Настройка pyright
		vim.lsp.config('pyright', {
		  capabilities = capabilities
		})
		vim.lsp.enable('pyright')
				end,
			},
}
