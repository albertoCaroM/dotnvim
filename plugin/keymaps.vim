scriptencoding utf-8

" let mapleader = ","


let g:mapleader = " " 
set timeoutlen=500                                  "mapping timeout
set ttimeoutlen=50                                  "keycode timeout


" Custom function
function! ToggleLineNumber()
  set number!
endfunction

" Custom shortcuts
"
nnoremap <leader>, :nohlsearch<CR>  "stop the highlight for the  previuos search pattern
map <leader>h :lua Hydra:exit()<CR>
map <leader>r :call ToggleLineNumber()<CR>

" vnoremap <leader> " "
" set timeoutlen 500 " Set timeout length to 500 ms
set showcmd

map <leader>n :set number!<CR>
" presisten block shifting
vnoremap < <gv
vnoremap > >gv

noremap <A-h> <C-w>h
noremap <A-j> <C-w>j
noremap <A-k> <C-w>k
noremap <A-l> <C-w>l

 

" remap arrow keys
nnoremap <left>  :bprev<CR>  
nnoremap <right> :bnext<CR> 
nnoremap <up>    :tabnext<CR>
nnoremap <down>  :tabprev<CR>

" smash escape
inoremap jk <esc>
inoremap kj <esc>

" sane regex 
" nnoremap / /v
" vnoremap / /v
" nnoremap ? ?v
" vnoremap ? ?v
" nnoremap :s/ :s/v


" folds 
nnoremap "zr" "zr:echo &foldlevel<cr>"
nnoremap "zm" "zm:echo &foldlevel<cr>"
nnoremap "zR" "zR:echo &foldlevel<cr>"
nnoremap "zM" "zM:echo &foldlevel<cr>"



" screen line scroll
nnoremap "<silent> j" "gj"
nnoremap "<silent> k" "gk"

" auto center 
nnoremap "<silent> n" "nzz"
nnoremap "<silent> N" "Nzz"
nnoremap "<silent> *" "*zz"
nnoremap "<silent> #" "#zz"
nnoremap "<silent> g*" "g*zz"
nnoremap "<silent> g#" "g#zz"
nnoremap "<silent> <C-o>" "<C-o>zz"
nnoremap "<silent> <C-i>" "<C-i>zz"


nnoremap "<leader>cn" ":cnext <cr>"
nnoremap "<leader>cp" ":cprevious<cr>"
nnoremap "<leader>co" ":copen<cr>"
nnoremap "<leader>cc" ":cclose<cr>"
nnoremap "<leader>cf" ":cfirst<cr>"
nnoremap "<leader>cc" ":clast<cr>"





nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition<CR>
nnoremap <silent> gh    <cmd>lua vim.lsp.buf.hover<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol



nnoremap <leader>S <cmd>Startify<cr>
" nnoremap <leader>d <cmd>Startify<cr>

" Find files using Telescope command-line sugar.
" nnoremap <leader>ff <cmd>Telescope find_files<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoremap <leader>fb <cmd>Telescope buffers<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" nnoremap <Leader>C  <cmd>Telescope commands<CR>
" nnoremap <leader>b  <cmd>Telescope buffers<cr>
" nnoremap <Leader>'  <cmd>Telescope marks<cr>




" vnoremap <leader>p "_dP

nnoremap Y y$

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap $ $<c-g>u
inoremap > ><c-g>u



vnoremap <leader>s :!sort<CR>

nnoremap <leader>wsv :vsp<CR>
nnoremap <leader>wsh :sp<CR>

nnoremap <leader>j :cnext<CR>zz
nnoremap <leader>k :cprev<CR>zz

nnoremap <leader>i :lnext<CR>
nnoremap <leader>o :lprev<CR>

nnoremap <leader>bd :bd!<CR>

nnoremap <expr> <leader><leader>dp ":saveas " .  expand('%')

" For moving quickly up and down,
" Goes to the first line above/below that isn't whitespace
" Thanks to: http://vi.stackexchange.com/a/213
nnoremap <silent> gj :let _=&lazyredraw<CR>:set lazyredraw<CR>/\%<C-R>=virtcol(".")<CR>v\S<CR>:nohl<CR>:let &lazyredraw=_<CR>
nnoremap <silent> gk :let _=&lazyredraw<CR>:set lazyredraw<CR>?\%<C-R>=virtcol(".")<CR>v\S<CR>:nohl<CR>:let &lazyredraw=_<CR>

" Run the last command
nnoremap <leader><leader>c :<up>


if has('nvim')
    " Make esc leave terminal mode
    " tnoremap <leader><Esc> <C-\><C-n>
    tnoremap <Esc><Esc> <C-\><C-n>
    tnoremap jk    <C-\><C-n>
    tnoremap kj    <C-\><C-n>

    " Easy moving between the buffers
    tnoremap <A-h> <C-\><C-n><C-w>h
    tnoremap <A-j> <C-\><C-n><C-w>j
    tnoremap <A-k> <C-\><C-n><C-w>k
    tnoremap <A-l> <C-\><C-n><C-w>l

    " Try and make sure to not manggle space items
    " tnoremap <S-Space> <Space>
    " tnoremap <C-Space> <Space>
endif


map <leader>1 <Cmd>BufferGoto 1<CR>
map <leader>2 <Cmd>BufferGoto 2<CR>
map <leader>3 <Cmd>BufferGoto 3<CR>
map <leader>4 <Cmd>BufferGoto 4<CR>
map <leader>5 <Cmd>BufferGoto 5<CR>
map <leader>6 <Cmd>BufferGoto 6<CR>
map <leader>7 <Cmd>BufferGoto 7<CR>
map <leader>8 <Cmd>BufferGoto 8<CR>
map <leader>9 <Cmd>BufferGoto 9<CR>
map <leader>0 <Cmd>BufferLast<CR>

nnoremap <leader>cc :cclose<CR>

map <leader>e <Cmd>NvimTreeToggle<CR>
map <leader>t1 <Cmd>ToggleTerm 1<CR>
map <leader>t2 <Cmd>ToggleTerm 2<CR>
map <leader>t3 <Cmd>ToggleTerm 3<CR>
map <leader>t4 <Cmd>ToggleTerm 4<CR>
map <leader>t5 <Cmd>ToggleTerm 5<CR>
map <leader>t6 <Cmd>ToggleTerm 6<CR>
map <leader>t7 <Cmd>ToggleTerm 7<CR>
map <leader>t8 <Cmd>ToggleTerm 8<CR>
map <leader>t9 <Cmd>ToggleTerm 9<CR>

map <leader>ta <Cmd>ToggleTermToggleAll<CR>





