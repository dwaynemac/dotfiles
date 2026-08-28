" Share the existing Vim configuration and native packages with Neovim.
set runtimepath^=~/.vim
set runtimepath+=~/.vim/after
let &packpath = &runtimepath

source ~/.vimrc

lua require("codex").setup({ launch = { auto_start = false } })
lua vim.lsp.enable("ruby_lsp")
lua vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP: Go to definition" })
