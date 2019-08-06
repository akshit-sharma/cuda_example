set nocompatible
filetype off

set background=dark

let user_home = '$HOME'
let config_home = '$DOTFILES_SCRIPT_PARENT'

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'dense-analysis/ale'

call vundle#end() 		" required

filetype plugin indent on 	" required

" ALE Lint 
let clang_home = '$DOTFILES_SCRIPT_PARENT/faaltu/clang+llvm'
let g:ale_completion_enabled = 0
let g:ale_linters = {
      \ 'c' : ['clang','clangd','clangtidy'],
      \ 'cpp' : ['clang','clangd','clangtidy'],
      \ 'cuda' : ['clang','clangd','clangtidy','nvcc'],
      \ }
let g:ale_fixers = {
  \ 'c' : ['clang-format'],
  \ 'cpp' : ['clang-format'],
  \ 'cuda' : ['clang-format'],
  \ 'cmake' : ['cmakeformat'],
  \ }
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_set_highlights = 0 " Disable highligting
let g:ale_c_build_dir_names = ['build','Build','bin']
let g:ale_c_parse_compile_commands = 1
let g:ale_c_clang_executable = expand(clang_home).'/bin/clang'
let g:ale_cpp_clang_executable = expand(clang_home).'/bin/clang++'
let g:ale_c_clangd_executable = expand(clang_home).'/bin/clangd'
let g:ale_cpp_clangd_executable = expand(clang_home).'/bin/clangd'
let g:ale_c_clangformat_executable = expand(clang_home).'/bin/clang-format'
let g:ale_cpp_clangformat_executable = expand(clang_home).'/bin/clang-format'
let g:ale_c_clangtidy_executable = expand(clang_home).'/bin/clang-tidy'
let g:ale_cpp_clangtidy_executable = expand(clang_home).'/bin/clang-tidy'
let g:ale_c_clangtidy_checks = ['bugprone','cppcoreguidelines','clang_analyzer','llvm','misc','modernize','performance','portability','readability']
let g:ale_cpp_clangtidy_checks = ['bugprone','cppcoreguidelines','clang_analyzer','llvm','misc','modernize','performance','portability','readability']
let g:ale_cmake_cmakelint_executable = expand(user_home).'/.local/bin/cmakelint'
let g:ale_cmake_cmakelint_options = '--config='.expand(config_home).'/.cmakelintrc'
let g:ale_cmake_cmakeformat_executable = expand(user_home).'/.local/bin/cmake-format'
let g:ale_cmake_cmakeformat_options = '-c '.expand(config_home).'/.clang-format.yml'
