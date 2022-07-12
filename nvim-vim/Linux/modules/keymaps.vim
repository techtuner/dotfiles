let mapleader = " "


" General

nnoremap <leader>q :q<cr>
nnoremap <leader>w :wq<cr>
nnoremap <C-w> :tabclose<cr>
nnoremap <silent><C-s> :update<cr>
vnoremap <silent><C-s> <C-C>:update<cr>
inoremap <silent><C-s> <C-O>:update<cr>

" Telescope
nnoremap <leader>ff :Telescope find_files<cr>
nnoremap <leader>fg :Telescope git_files<cr>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({search = vim.fn.input("Grep For >")})

" Tree Sitter
nnoremap <C-t> :NvimTreeToggle .<cr>

" Indentation
vnoremap < <gv
vnoremap > >gv

" Copying Content to Clipboard (Yanking)
nnoremap <leader>Y gg\+yG
vnoremap <leader>Y gg\+yG
nnoremap <leader>y \"+y
vnoremap <leader>y \"+y

" Shift between Tabs
nnoremap <C-Right> gt
nnoremap <C-Left>  gT

" Creating a tab
nnoremap <C-t> :tabnew<cr>
nnoremap <C-w> :tabclose<cr>

" Remove Whitespaces
nnoremap <leader>sws :%s/\s\+$//<CR>
