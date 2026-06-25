return {
  {
    "lervag/vimtex",
    lazy = false, -- VimTeX recommends not lazy-loading
    init = function()
      -- Use VimTeX's default PDF viewer (e.g., 'zathura', 'sioyek', or 'view_mac')
      vim.g.vimtex_view_method = 'general'
      vim.g.vimtex_view_general_viewer = 'okular'

      -- Automatically open the quickfix window on compilation errors
      vim.g.vimtex_quickfix_mode = 0
    end
  }
}

