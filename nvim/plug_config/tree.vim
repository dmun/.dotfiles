nnoremap <silent><leader>e :NvimTreeToggle<CR>
let g:nvim_tree_highlight_opened_files = 1
let g:nvim_tree_hide_dotfiles = 1

lua <<EOF
    local tree_cb = require'nvim-tree.config'.nvim_tree_callback
    vim.g.nvim_tree_bindings = {
      ["l"]              = tree_cb("edit"),
      ["h"]              = tree_cb("close_node"),
      ["<CR>"]           = tree_cb("cd"),
    }
EOF
