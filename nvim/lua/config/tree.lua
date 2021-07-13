vim.cmd [[
nnoremap <silent><leader>e :NvimTreeToggle<CR>
let g:nvim_tree_highlight_opened_files = 1
let g:nvim_tree_hide_dotfiles = 1
]]

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {
	{ key = "l", cb = tree_cb("edit") },
	{ key = "h", cb = tree_cb("close_node") },
	{ key = "<CR>", cb = tree_cb("cd") },
}
