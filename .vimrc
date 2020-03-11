
set number
set relativenumber
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
set splitbelow
set splitright
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nmap j gj
nmap k gk
call plug#begin('~/.vim/plugged')
Plug 'nightsense/carbonized'
Plug 'SirVer/ultisnips'
Plug 'tounaishouta/coq.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'danilo-augusto/vim-afterglow'
Plug 'thomasfaingnaert/vim-lsp-snippets'
Plug 'thomasfaingnaert/vim-lsp-ultisnips'
Plug 'tpope/vim-fugitive'
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
call plug#end()
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
nnoremap <leader>t      :LspHover<CR>
nnoremap <leader>d      :LspDefinition<CR>
nnoremap <leader>ev     :tabe ~/.vimrc<CR>
nnoremap <leader>sv     :so ~/.vimrc<CR>
nnoremap <leader>q      :wqa<CR>
autocmd Filetype coq nnoremap <leader>c :CoqRunToCursor<CR>
imap <c-space> <Plug>(asyncomplete_force_refresh)
if executable('gopls')
      au User lsp_setup call lsp#register_server({
              \ 'name': 'gopls',
              \ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
              \ 'whitelist': ['go'],
              \ })
          autocmd BufWritePre *.go LspDocumentFormatSync
        endif
if executable('hie')
      au User lsp_setup call lsp#register_server({
              \ 'name': 'hie',
              \ 'cmd': {server_info->['hie', '--lsp']},
              \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'stack.yaml'))},
              \ 'whitelist': ['haskell'],
              \ })
          autocmd BufWritePre *.go LspDocumentFormatSync
        endif
let g:lsp_signs_enabled = 1         " enable signs
let g:lsp_highlight_references_enabled = 1
au User lsp_setup call lsp#register_server({
   \ 'name': 'javascript support using typescript-language-server',
   \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
   \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'package.json'))},
   \ 'whitelist': ['javascript', 'javascript.jsx', 'javascriptreact'],
   \ })
set completeopt+=menuone
colorscheme afterglow
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
augroup ProjectDrawer
      autocmd!
        autocmd VimEnter * :Vexplore
    augroup END
au VimEnter * :wincmd w
let g:UltiSnipsSnippetDirectories=["/home/gauravity/.vim/UltiSnips"]
