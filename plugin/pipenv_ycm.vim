if exists("g:pipenv_ycm_loaded")
    finish
endif

let g:pipenv_ycm_loaded = 1
let g:pipenv_ycm_activated = 0
let s:save_cpo = &cpo
set cpo&vim

if exists("g:ycm_python_binary_path")
    " If ycm python path is already set, this will be our fallback
    let g:pipenv_ycm_default_python = g:ycm_python_binary_path
endif

if !exists("g:pipenv_ycm_default_python")
    if has('python3')
        let g:pipenv_ycm_default_python = 'python3'
    elseif has('python')
        let g:pipenv_ycm_default_python = 'python'
    else
        finish
    endif
endif

if !exists("g:pipenv_ycm_auto_activate")
    let g:pipenv_ycm_auto_activate = 1
endif

if !exists("g:pipenv_ycm_auto_switch")
    let g:pipenv_ycm_auto_switch = 1
endif

command! -bar -nargs=? -complete=custom,s:CompletePipenvYcm PipenvYcm :call pipenv_ycm#command(<q-args>)

function! s:CompletePipenvYcm(ArgLead, CmdLine, CursorPos)
    " let function = system("pipenv --completion")
    " let what =  system(function)
    return "install\nuninstall\ngraph\nupdate\nsync\nlock\nclean\nrun\nenable\ndisable\n"
endfunction

if g:pipenv_ycm_auto_activate == 1
    call pipenv_ycm#enable_auto()
endif

let &cpo = s:save_cpo
