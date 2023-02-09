" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/bundle')

" Declare the list of plugins.
 Plug 'dracula/vim'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
 Plug 'scrooloose/nerdtree'
" Plug 'preservim/nerdcommenter'
" Plug 'mhinz/vim-startify'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'ryanoasis/vim-devicons'
" Plug 'tell-k/vim-autopep8'
"
" " Markdown
" Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
 
 " Terraform
" Plug 'hashivim/vim-terraform'
" Plug 'vim-syntastic/syntastic'
" Plug 'juliosueiras/vim-terraform-completion'
" Plug 'sheerun/vim-polyglot'
 " Python
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'zchee/deoplete-jedi'
 " List ends here. Plugins become visible to Vim after this call.
call plug#end()

