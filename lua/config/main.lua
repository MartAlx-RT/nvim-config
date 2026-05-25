vim.opt.number = true
vim.opt.showmode = true
vim.opt.showcmd = true
vim.opt.ruler = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.autoindent = true
vim.opt.lazyredraw = true
vim.opt.magic = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = false
vim.opt.smartcase = true
vim.opt.encoding="utf-8"
vim.opt.modelines=0
vim.opt.formatoptions="tqn1"
vim.opt.expandtab=false
vim.opt.cmdheight=1
vim.opt.laststatus=2
vim.opt.backspace="indent,eol,start"
vim.opt.list = false
vim.opt.matchpairs = vim.opt.matchpairs+"<:>"
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

vim.cmd("command FixIt lua vim.lsp.buf.code_action()")

vim.diagnostic.config({
  virtual_text = true,
})

vim.cmd("map <space>e :lua vim.diagnostic.open_float(0, {scope=\"line\"})<CR>")

