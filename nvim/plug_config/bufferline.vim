lua require'bufferline'.setup{ options = { show_buffer_close_icons = false } }

" Navigate buffers
nnoremap <silent><M-.> :BufferLineCycleNext<CR>
nnoremap <silent><M-,> :BufferLineCyclePrev<CR>

" Move buffers
nnoremap <silent><M->> :BufferLineMoveNext<CR>
nnoremap <silent><M-<> :BufferLineMovePrev<CR>
