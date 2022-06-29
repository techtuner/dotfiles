vim.cmd [[vim
nnoremap <leader>t :NERDTree<CR>
nnoremap <leader><CR> :so%<CR>
vnoremap <leader><CR> :so%<CR>
noremap <leader>y "+y
vnoremap <leader>y "+y
vnoremap <leader>Y gg"+yG
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>
nnoremap <silent> <C-n> :tabnew<CR> " Create a New tab
nnoremap <silent> <C-w> :tabclose<CR> " Close the current tab
nnoremap <silent> <S-Left> :tabnext -<CR> " Switch to previous tab
nnoremap <silent> <S-Right> :tabnext +<CR> " Switch to next tab
nnoremap <silent> <C-Left> :-tabmove -<CR> " Move the tab back
nnoremap <silent> <C-Right> :-tabmove +<CR> " Move tab next
]]
