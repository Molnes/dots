local vim = vim --supress lsp warnings
local o = vim.opt

o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.expandtab = true
o.wrap = false
o.number = true
o.cursorline = true
o.relativenumber = true

local g = vim.g
g.mapleader = " "
g.maplocalleader = " "

local opts = { silent = true }
local map = vim.keymap.set

map("t", "<Esc>", [[<C-\><C-n>]], opts) -- exit terminal mode
map("n", "<leader>t", "<cmd>term zsh<cr>", opts)


vim.pack.add({ 'https://github.com/nvim-treesitter/nvim-treesitter' })
local tree = require('nvim-treesitter')
tree.setup({
  ensure_installed = { 'lua', 'vim', 'rust', 'typescript', 'javascript' },
  auto_install = true,
  highlight = {
    enable = true,
  },
})

vim.filetype.add({
  extension = {
    svelte = 'svelte',
  },
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'svelte',
  callback = function()
    vim.treesitter.start()
  end,
})



vim.pack.add({'https://github.com/neovim/nvim-lspconfig', 'https://github.com/mason-org/mason.nvim', 'https://github.com/mason-org/mason-lspconfig.nvim' })
require("mason").setup()
require("mason-lspconfig").setup()



vim.pack.add({ 'https://github.com/saghen/blink.lib', 'https://github.com/saghen/blink.cmp' })
local cmp = require('blink.cmp')
cmp.build():pwait()
cmp.setup()


vim.pack.add({'https://github.com/pineapplegiant/spaceduck'})
vim.cmd("colorscheme spaceduck")
