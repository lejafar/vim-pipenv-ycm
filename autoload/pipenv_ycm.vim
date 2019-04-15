" pipenv-ycm-vim core commands
" Version: 0.0.1

"if shell_error == 0
  "let venv_path = substitute(pipenv_venv_path, '\n', '', '')
  "let g:ycm_python_binary_path = venv_path . '/bin/python'
"else
  "let g:ycm_python_binary_path = 'python'
"endif

function! pipenv_ycm#command(...)
    let action = a:0 > 0 ? a:1 : ''
    if len(action) != 0
        if action == 'disable'
            let g:pipenv_ycm_activated = 0
            let g:ycm_python_binary_path = g:pipenv_ycm_default_python
            return
        endif
        if action == 'enable'
            call pipenv_ycm#activate(1)
            return
        endif
        echo "Executing pipenv " . action . " ..."
        let output=systemlist("pipenv " . action)
        for line in output
            echom line
        endfor
    else
        " If no command, activate pipenv of currently selected buffer
        call pipenv_ycm#activate(1)
    endif
endfunction

function! pipenv_ycm#enable_auto()
    autocmd filetype python call pipenv_ycm#activate()
    autocmd BufEnter python call pipenv_ycm#activate()
endfunction

function! pipenv_ycm#debug(Wow)
    echomsg "event: " . a:Wow
endfunction

function! pipenv_ycm#activate(...)
    let force = a:0 > 0 ? 1 : 0
    if g:pipenv_ycm_activated == 0
        " No pipenv yet: try to load one from the current file
        let g:pipenv_ycm_activated = 1
        let venv_path = system('sh -c "export PIPENV_IGNORE_VIRTUALENVS=1;export PIPENV_VERBOSITY=-1; cd ' . expand('%:p:h') . '; pipenv --venv"')
        if shell_error == 0
            "let venv_name = substitute(venv_path, '\(\/.\+\/\|\n\|\r\)', '', '')
            let venv_path = trim(substitute(venv_path, '\n', '', ''))
            let g:venv_name = venv_path
            let g:ycm_python_binary_path = venv_path . '/bin/python'
        else
            let g:ycm_python_binary_path = g:pipenv_ycm_default_python
        endif
    else
        " Already a pipenv active, check if still the same
        if g:pipenv_ycm_auto_switch == 0 && force == 0
            return
        endif
        let venv_path = system('sh -c "export PIPENV_IGNORE_VIRTUALENVS=1;export PIPENV_VERBOSITY=-1; cd ' . expand('%:p:h') . '; pipenv --venv"')
        if shell_error == 0
            "let venv_name = substitute(venv_path, '\(\/.\+\/\|\n\|\r\)', '', '')
            let venv_path = trim(substitute(venv_path, '\n', '', ''))
            if venv_path != g:venv_name
                " Other venv detected, switch!
                let g:venv_name = venv_path
                let g:ycm_python_binary_path = venv_path . '/bin/python'
                exec "py3" "ycm_state.RestartServer()"
            endif
        endif
    endif
endfunction
