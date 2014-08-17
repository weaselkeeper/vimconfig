" vimrc file for following the coding standards specified in PEP 7 & 8.
"
" To use this file, source it in your own personal .vimrc file (``source
" <filename>``) or, if you don't have a .vimrc file, you can just symlink to it
" (``ln -s <this file> ~/.vimrc``).  All options are protected by autocmds
" (read below for an explanation of the command) so blind sourcing of this file
" is safe and will not affect your settings for non-Python or non-C files.
"
"
" All setting are protected by 'au' ('autocmd') statements.  Only files ending
" in .py or .pyw will trigger the Python settings while files ending in *.c or
" *.h will trigger the C settings.  This makes the file "safe" in terms of only
" adjusting settings for Python and C files.
"
" Only basic settings needed to enforce the style guidelines are set.
" Some suggested options are listed but commented out at the end of this file.

" Number of spaces that a pre-existing tab is equal to.
" For the amount of space used for a new tab use shiftwidth.
au BufRead,BufNewFile *.c,*.h set tabstop=8

" Set trailing spaces to be visible as character
set listchars=tab:>-,trail:-
set list

call pathogen#infect()

" Needs 7.3 or better
if version >= 703
" Set a visible 80 column line
 set cc=80
" Don't use an undo file
 set noundofile

endif

" Enable git plugin
"set laststatus=2
"set statusline=%{GitBranch()}

" What to use for an indent.
" This will affect Ctrl-T and 'autoindent'.
": tabs (pre-existing files) or 4 spaces (new files)
fu Select_c_style()
    if search('^\t', 'n', 150)
        set shiftwidth=8
        set noexpandtab
    el 
        set shiftwidth=4
        set expandtab
    en
endf
au BufRead,BufNewFile *.c,*.h call Select_c_style()
au BufRead,BufNewFile Makefile* set noexpandtab

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw,*.hs match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.pp,*.py,*.pyw,*.c,*.h,*.hs match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
" Python: 79 
" C: 79
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h set textwidth=79

" Turn off settings in 'formatoptions' relating to comment formatting.
" - c : do not automatically insert the comment leader when wrapping based on
"    'textwidth'
" - o : do not insert the comment leader when using 'o' or 'O' from command mode
" - r : do not insert the comment leader when hitting <Enter> in insert mode
" Python: not needed
" C: prevents insertion of '*' at the beginning of every line in a comment
au BufRead,BufNewFile *.c,*.h set formatoptions-=c formatoptions-=o formatoptions-=r

" Use UNIX (\n) line endings.
" Only used for new files so as to not force existing files to change their
" line endings.
" Python: yes
" C: yes
au BufNewFile *.py,*.pyw,*.c,*.h,*.hs  set fileformat=unix



" ----------------------------------------------------------------------------
" The following section contains suggested settings.  While in no way required
" to meet coding standards, they are helpful.

" Set the default file encoding to UTF-8: ``set encoding=utf-8``

" Puts a marker at the beginning of the file to differentiate between UTF and
" UCS encoding (WARNING: can trick shells into thinking a text file is actually
" a binary file when executing the text file): ``set bomb``

" For full syntax highlighting:
"``let python_highlight_all=1``
"``syntax on``

" Automatically indent based on file type: ``filetype indent on``
" Keep indentation level from previous line: ``set autoindent``

" Folding based on indentation: ``set foldmethod=indent``


" Python specific tweaks
au BufRead,BufNewFile *.py,*.pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set smartindent
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py,*.pyw set tabstop=8
au BufRead,BufNewFile *.py,*.pyw set textwidth=79
au BufRead,BufNewFile *.py,*.pyw set encoding=utf-8
au BufRead,BufNewFile *.py,*.pyw let python_highlight_all=1
"au BufRead,BufNewFile *.py,*.pyw set foldmethod=indent
au BufRead,BufNewFile *.py,*.pyw set softtabstop=4
" -*- mode: python; indent-tabs-mode: nil; -*-
" vim:shiftwidth=2:tabstop=8:expandtab:textwidth=78:softtabstop=4:ai:

"autocmd bufnewfile *.py so ~/.config/python_template
"autocmd bufnewfile *.py exe "1," . 12 . "g/File Name :.*/s//File Name : " .expand("%")
"autocmd bufnewfile *.py exe "1," . 12 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d-%m-%Y")
"autocmd Bufwritepre,filewritepre *.py execute "normal ma"
"autocmd Bufwritepre,filewritepre *.py exe "1," . 12 . "g/Last Modified :.*/s//Last Modified : " .strftime("%c")
"autocmd bufwritepost,filewritepost *.py execute "normal `a"


" Haskell specific tweaks
au BufRead,BufNewFile *.hs set shiftwidth=8
au BufRead,BufNewFile *.hs set smartindent
au BufRead,BufNewFile *.hs set expandtab
au BufRead,BufNewFile *.hs set tabstop=8
au BufRead,BufNewFile *.hs set textwidth=79
au BufRead,BufNewFile *.hs set encoding=utf-8
au BufRead,BufNewFile *.hs set foldmethod=indent
au BufRead,BufNewFile *.hs set softtabstop=8
"autocmd bufnewfile *.hs  so ~/.config/haskell_template
"autocmd bufnewfile *.hs  exe "1," . 12 . "g/File Name :.*/s//File Name : " .expand("%")
"autocmd bufnewfile *.hs  exe "1," . 12 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d-%m-%Y")
"autocmd Bufwritepre,filewritepre *.hs  execute "normal ma"
"autocmd Bufwritepre,filewritepre *.hs  exe "1," . 12 . "g/Last Modified :.*/s//Last Modified : " .strftime("%c")
"autocmd bufwritepost,filewritepost *.hs  execute "normal `a"




" Puppet specific tweaks
"au BufRead,BufNewFile *.pp set nowrap linebreak textwidth=0 
au BufRead,BufNewFile *.pp set shiftwidth=4
au BufRead,BufNewFile *.pp set smartindent
au BufRead,BufNewFile *.pp set expandtab
au BufRead,BufNewFile *.pp set tabstop=4
au BufRead,BufNewFile *.pp set textwidth=79
au BufRead,BufNewFile *.pp set encoding=utf-8
au BufRead,BufNewFile *.pp set softtabstop=4
au BufRead,BufNewFile *.pp nmap <F8> :TagbarToggle<CR>
"au BufRead,BufNewFile *.pp set foldmethod=indent


" Add some go lang stuff
au BufRead,BufNewFile *.go set filetype=go


autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

" alias command to remove trailing whitespace that often comes along with a cut
" and paste
command Killtws %s/\s\+$//



hi ColorColumn ctermbg=lightblue guibg=lightblue

"if &diff
"set t_Co=256
"set backgroud=dark
"colorscheme solarized
"else
"colorscheme peaksea
"endif
"match ExtraWhitespace /\s\+\%#\@<!$/
