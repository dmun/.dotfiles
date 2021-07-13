require("bufferline").setup {
	options = {
		offsets = {{filetype = "NvimTree", text = " EXPLORER", text_align = "left"}},
		show_close_icon = false,
	}
}

vim.cmd [[
nnoremap <silent><M-n> :BufferLineCycleNext<CR>
nnoremap <silent><M-p> :BufferLineCyclePrev<CR>

nnoremap <silent><M-N> :BufferLineMoveNext<CR>
nnoremap <silent><M-P> :BufferLineMovePrev<CR>

nnoremap <silent><leader>be :BufferLineSortByExtension<CR>
nnoremap <silent><leader>bd :BufferLineSortByDirectory<CR>

hi BufferLineFill guifg=NONE ctermfg=NONE guibg=#252526 ctermbg=235 gui=NONE cterm=NONE
hi BufferLineBackground guifg=#999999 ctermfg=NONE guibg=#2d2d2d ctermbg=235 gui=NONE cterm=NONE

hi BufferLineTab guifg=#d4d4d4 ctermfg=188 guibg=#2d2d2d ctermbg=235 gui=NONE cterm=NONE
hi BufferLineTabClose guifg=#d4d4d4 ctermfg=188 guibg=#2d2d2d ctermbg=235 gui=NONE cterm=NONE
hi BufferLineTabSelected guifg=#d4d4d4 ctermfg=188 guibg=#1e1e1e ctermbg=234 gui=NONE cterm=NONE

hi BufferLineCloseButton guifg=#d4d4d4 ctermfg=188 guibg=#2d2d2d ctermbg=234 gui=NONE cterm=NONE
hi BufferLineCloseButtonVisible guifg=#d4d4d4 ctermfg=188 guibg=#1e1e1e ctermbg=234 gui=NONE cterm=NONE
hi BufferLineCloseButtonSelected guifg=#d4d4d4 ctermfg=188 guibg=#1e1e1e ctermbg=234 gui=NONE cterm=NONE

hi BufferLineModified guifg=#999999 ctermfg=NONE guibg=#2d2d2d ctermbg=235 gui=NONE cterm=NONE

hi BufferLineSeparator guifg=#252526 ctermfg=188 guibg=#2d2d2d ctermbg=234 gui=NONE cterm=NONE
hi BufferLineBufferSelected gui=bold
]]
