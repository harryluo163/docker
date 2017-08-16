 """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " => vim-multiple-cursors
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_next_key="\<C-n>"
 
 """""""""""""""""""""""""""""""""""""
 " =>doxygen.vim
 ":DoxLic :DoxAuthor :Dox :DoxUndoc :DoxBlock
 """""""""""""""""""""""""""""""""""""
"let g:DoxygenToolkit_commentType = "C++"
let g:DoxygenToolkit_authorName="ljh"
let s:licenseTag = "Copyright(C)\<enter>"
let s:licenseTag = s:licenseTag . "For free\<enter>"
let s:licenseTag = s:licenseTag . "All right reserved\<enter>"
let g:DoxygenToolkit_licenseTag = s:licenseTag
let g:doxygen_enhanced_color=1
let g:DoxygenToolkit_briefTag_pre="@brief  "
let g:DoxygenToolkit_briefTag_funcName="yes"
"let g:DoxygenToolkit_briefTag_post = "<++>"
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_returnTag="@return "
"let g:DoxygenToolkit_blockHeader="-------------------------------------------------------"
"let g:DoxygenToolkit_blockFooter="-------------------------------------------------------"
let g:DoxygenToolkit_compactOneLineDoc = "yes"
"let g:DoxygenToolkit_throwTag_pre = "@throw "
"let g:DoxygenToolkit_throwTag_post = ""  
"let g:DoxygenToolkit_templateParamTag_pre = "@tparam "   
"let g:DoxygenToolkit_templateParamTag_post = "<>"    
"let g:DoxygenToolkit_interCommentTag = " * "
"let g:DoxygenToolkit_briefTag_className = "yes" 
"let g:DoxygenToolkit_briefTag_structName = "yes"   
"let g:DoxygenToolkit_briefTag_enumName = "yes"       
"let g:DoxygenToolkit_briefTag_namespaceName = "yes"  


 """""""""""""""""""""""""""""""""""""
 " =>syntastic checks
 " :SyntasticToggleMode关闭语法检查 :SyntasticCheck phpcs开启检查 SyntasticInfo语法检查器信息
 """""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']

nnoremap <silent> <Leader>st :SyntasticToggleMode<CR>
nnoremap <silent> <Leader>sc :SyntasticCheck<CR>
nnoremap <silent> <Leader>si :SyntasticInfo<CR>


 """""""""""""""""""""""""""""""
 " => neocomplete.vim
 """""""""""""""""""""""""""""""
 
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

let g:neocomplete#sources#omni#input_patterns.php =
     \ '\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
