set rnu
set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
" don't show --INSERT-- etc
set noshowmode

call plug#begin()

Plug 'KarimElghamry/vim-auto-comment'                  " For commenting <C-/>
Plug 'https://github.com/bfrg/vim-cpp-modern'          " syntaxhighligth
Plug 'https://github.com/jiangmiao/auto-pairs'         " auto pairs
Plug 'cocopon/vaffle.vim'                              " File manager
Plug 'neoclide/coc.nvim',{'branch': 'release' }        " autoComplete
Plug 'https://github.com/ryanoasis/vim-devicons'       " file icon
Plug 'https://github.com/kien/rainbow_parentheses.vim' " Rainbow Brackets
Plug 'sakshamgupta05/vim-todo-highlight'               " text highlight ex: TODO: NOTE:
Plug 'junegunn/vim-easy-align'                         " Align text
Plug 'bronson/vim-trailing-whitespace'                 " Trailng whitespace
Plug 'monsonjeremy/onedark.nvim'                       " Theme
Plug 'itchyny/lightline.vim'                           " pretty status bar
Plug 'tbastos/vim-lua'                                 " syntaxhighligth for lua
Plug 'mhinz/vim-startify'                              " start screen

call plug#end()

" Key map
let mapleader = ";"

" Insert mode
" for CONST_WRITING I love it <3
inoremap <leader>u <Esc>bveUea
" fast normal mode
inoremap jj <Esc>
" quicker equals sign (=)
inoremap <c-z> =
" auto Complete with Tab and not <c-n> or <c-p>
inoremap <s-Tab> <c-n>
" paste from clipboard
inoremap <S-Insert> <Esc>"+Pi

" Normal mode
" Edit and run .vimrc
nnoremap <leader>rc :vsplit $MYVIMRC<cr>
nnoremap <leader>cr :source $MYVIMRC<cr>

" File explore with Vaffle or coc-explorer
nnoremap <leader>f :30vsplit<cr>:Vaffle<cr>
" nmap <leader>f <Cmd>CocCommand explorer<CR>

" Move between window
nnoremap <leader>h <c-w>h
nnoremap <leader>j <c-w>j
nnoremap <leader>k <c-w>k
nnoremap <leader>l <c-w>l

" Close all window except current
nnoremap <leader>o <c-w>o

" Quick save and terminal and run custom task
nnoremap <leader>t :w<cr>:te<cr>i<Tab><cr>
" Insert a new blank line
nnoremap <leader><cr> o<esc>k

" End Key map

" Theme
lua require('onedark').setup()

" Turn off trailing whitespace in startify
let g:extra_whitespace_ignored_filetypes = ['']

" Rainbow brackets
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['darkcyan',         'RoyalBlue3'],
    \ ]

" Vaffle
let g:vaffle_show_hidden_files = 1
" file icon
function! VaffleRenderCustomIcon(item)
    return WebDevIconsGetFileTypeSymbol(a:item.basename, a:item.is_dir)
endfunction
let g:vaffle_render_custom_icon = 'VaffleRenderCustomIcon'

" turn off coc syntax cheker
let b:coc_diagnostic_disable = 1

" Highlight text
let g:todo_highlight_disable_default = ['TODO', 'FIXME']
let g:todo_highlight_config = {
      \   'TODO': {
      \     'gui_fg_color': '#ffffff',
      \     'gui_bg_color': '#FFB140',
      \   },
      \   'FIXME': {
      \     'gui_fg_color': '#ffffff',
      \     'gui_bg_color': '#F71735',
      \   },
      \   'NOTE': {
      \     'gui_fg_color': '#ffffff',
      \     'gui_bg_color': '#02C3BD',
      \   },
      \   'ADDED': {
      \     'gui_fg_color': '#ffffff',
      \     'gui_bg_color': '#00C49A',
      \   },
      \   'PESUDOCODE': {
      \     'gui_fg_color': '#ffffff',
      \     'gui_bg_color': '#6874E8',
      \   },
      \   'BEGIN': {
      \     'gui_fg_color': '#ffffff',
      \     'gui_bg_color': '#6874E8',
      \   },
      \   'END': {
      \     'gui_fg_color': '#ffffff',
      \     'gui_bg_color': '#6874E8',
      \   },
      \ }


" Easy align interactive Enter than 2<space>
vnoremap <silent> <Enter> :EasyAlign<cr>

" commenting
let g:inline_comment_dict = {
		\'//': ["js", "ts", "cpp", "c", "dart"],
		\'#': ['py', 'sh'],
		\'"': ['vim'],
        \'--': ['lua'],
		\}

" For startify
let g:ascii = [
\'    ____                                   _    ___         ',
\'   / __ \__  ______  ____ ____  ____  ____| |  / (_)___ ___ ',
\'  / / / / / / / __ \/ __ `/ _ \/ __ \/ __ \ | / / / __ `__ \',
\' / /_/ / /_/ / / / / /_/ /  __/ /_/ / / / / |/ / / / / / / /',
\'/_____/\__,_/_/ /_/\__, /\___/\____/_/ /_/|___/_/_/ /_/ /_/ ',
\'                  /____/                                    ',
\'',
\]

let g:startify_custom_header =
      \ 'startify#center(g:ascii + startify#fortune#boxed())'

" BEGIN: Coc
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code. There have been change from f to g by DungeonVim
xmap <leader>g  <Plug>(coc-format-selected)
nmap <leader>g  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" END: Coc
