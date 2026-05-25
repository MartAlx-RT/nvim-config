return {
--	{
		"nanotech/jellybeans.vim",
		--"folke/tokyonight.nvim",
		--"https://github.com/alexpasmantier/hubbamax.nvim",
		--"https://github.com/rose-pine/neovim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme habamax")
		end,
--	},
}
