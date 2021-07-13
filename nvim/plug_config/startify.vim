let g:startify_custom_header = [
		\ '',
		\ '     __   __   ______   ______   __   __ __   __    __    ',
		\ '    /\ "-.\ \ /\  ___\ /\  __ \ /\ \ / //\ \ /\ "-./  \   ',
		\ '    \ \ \-.  \\ \  __\ \ \ \/\ \\ \ \ / \ \ \\ \ \-./\ \  ',
		\ '     \ \_\\"\_\\ \_____\\ \_____\\ \__|  \ \_\\ \_\ \ \_\ ',
		\ '      \/_/ \/_/ \/_____/ \/_____/ \/_/    \/_/ \/_/  \/_/ ']

let g:startify_lists = [
		\ { 'type': 'files',     'header': ['   Files']                        },
		\ { 'type': 'sessions',  'header': ['   Sessions']                     },
		\ { 'type': 'bookmarks', 'header': ['   Bookmarks']                    },
		\ ]

let g:webdevicons_enable_startify = 1

let g:startify_bookmarks = [
		\ { 'w': '~/.config/awesome/rc.lua' },
		\ { 'n': '~/.config/nvim/init.vim' },
		\ { 'z': '~/.zshrc' },
		\ ]
