function! BuildXlf()
    let l:radioSwProj = GetRadioSwPath()
    if l:radioSwProj != -1
        let l:buildFolder = l:radioSwProj . '/build'
        if isdirectory(l:buildFolder) 
            let l:command = "terminal build-xlf.sh " . l:buildFolder
            execute l:command
        else
            echom "Not a build directory " . l:buildFolder
        endif
    else
        echo "Not a radiosw project"
    endif
endfunction

function! Codestyle()
    let l:radioSw = split(getcwd(), '/')[2]
    execute "terminal codestyle.sh " . l:radioSw
endfunction

function! BuildRadioSw()
    let l:radioSw = split(getcwd(), '/')[2]
    execute "terminal build-radio.sh " . l:radioSw
endfunction

function! TestRadioSw(args)
    let l:radioSw = split(getcwd(), '/')[2]
    let l:command = "terminal test-radio.sh " . l:radioSw . ' ' . a:args
    execute l:command
endfunction

function! BuildElvis()
    let l:radioSwProj = GetRadioSwProj()
    if l:radioSwProj != -1
        let l:command = "terminal build-elvis.sh " . l:radioSwProj
        execute l:command
    else
        echo "Not a radiosw project"
    endif
endfunction

function! UploadSw(args)
    let l:radioSwProj = GetRadioSwProj()
    if l:radioSwProj != -1
        let l:command = "terminal upload.sh " . a:args . ' ' . l:radioSwProj . ' 1'
        execute l:command
    else
        echo "Not a radiosw project"
    endif
endfunction

function! BuildUnitTest()
    echo "Building unit tests"
    let l:radioSwProj = GetRadioSwProj()
    if l:radioSwProj != -1
        let l:command = "terminal build-unittest.sh " . l:radioSwProj
        execute l:command
    else
        echo "Not a radiosw project"
    endif
endfunction

function! GetRadioSwProj()
    let l:path = split(getcwd(), '/')
    if len(l:path) >= 2 && match(l:path[2], 'radiosw') == 0
        return l:path[2]
    else
        return -1
    endif
endfunction

function! FinishCscope(channel)
    echo "Finish cscope"
    :cscope add cscope.out
    :cscope reset
endfunction

function! ReloadCscope(channel)
    echo "Running cscope -Rb"
    call job_start("cscope -Rb", {'close_cb': 'FinishCscope', 'out_io':'null'})
endfunction

function! RunCscopeAsync()
    call job_start("find ./src/main/java -name *.java", {'close_cb': 'ReloadCscope', 'out_io':'file', 'out_name':'cscope.files'})
endfunction

function! ReloadCtags(channel)
    echo "Finished ctags"
endfunction

function! RunCtagsRadiosw()
    let l:ctagsCmd = 'ctags -R ' . GetRadioSwPath() . '/sw/app'
    call job_start(l:ctagsCmd, {'close_cb': 'ReloadCtags', 'out_io':'null'})
endfunction

function! RunCtagsElvis()
    let l:ctagsCmd = 'ctags -R ' . GetRadioSwPath() . '/test/elvis/src/main'
    call job_start(l:ctagsCmd, {'close_cb': 'ReloadCtags', 'out_io':'null'})
endfunction

function! ReloadCscopeRadiosw(channel)
    echo "Find finished. Reruning cscope -Rb"
    let l:ctagsCmd = 'cscope -Rb '
    call job_start(l:ctagsCmd, {'close_cb': 'ReloadCscope', 'out_io':'null'})
endfunction

function! RunCscopeRadiosw()
    let l:ctagsCmd = 'find ' . GetRadioSwPath() . '/sw/app -type f -not -path *unitTest*'
    echom l:ctagsCmd
    call job_start(l:ctagsCmd, {'close_cb': 'ReloadCscopeRadiosw', 'out_io':'file', 'out_name':'cscope.files'})
endfunction

function! FileExt()
    let l:dir = GetRadioSwPath()
    if l:dir != -1
        if IsTestDirectory()
            let l:swDir = l:dir . '/test/elvis/src/main/java'
            let l:testDir = l:dir . '/test/elvis/testsuites'
            let l:dbDir = l:dir . '/test/elvis/src/main/resources'
        else
            let l:testDir = l:dir . '/test/stubs'
            let l:swDir = l:dir . '/sw/app'
            let l:dbDir = l:dir . '/sw/config/db'
        endif
        let l:source = 'find ' . l:testDir . ' ' . l:swDir . ' ' . l:dbDir . ' -type f' 
        return fzf#run(fzf#wrap('files', {'options':['-m', '--prompt', l:dir .'> '], 'source': l:source}, 0))
    else
        :Files
    endif
endfunction

function! IsTestDirectory()
    let l:path = split(getcwd(), '/')
    if len(l:path) >= 4 && match(l:path[4], 'elvis') == 0
        return 1
    else
        return 0
    endif
endfunction

function! GetRadioSwPath()
    let l:path = split(getcwd(), '/')
    if len(l:path) >= 2 && match(l:path[2], 'radiosw') == 0
        return '/' . join(l:path[0:2], '/')
    else
        return -1
    endif
endfunction

function! GetLatestLog(lastLog)
    let l:logsDir = split(globpath('/repo/ezleeda/jcat', '201*'), '\n')[-1]
    let l:logsDir2 = split(globpath(l:logsDir, '201*'), '\n')[-1 - a:lastLog]
    execute ":e " . l:logsDir2 . '/console.log'
endfunction 

command! -nargs=0 -complete=shellcmd Build call BuildRadioSw()
command! -nargs=0 -complete=shellcmd BuildXlf call BuildXlf()
command! -nargs=0 -complete=shellcmd ElvisBuild call BuildElvis()
command! -nargs=? -complete=shellcmd Test call TestRadioSw(<q-args>)
command! -nargs=? -complete=shellcmd Upload call UploadSw(<q-args>)
command! -nargs=? -complete=shellcmd Codestyle call Codestyle()
command! -nargs=? -complete=shellcmd BuildUnitTest call BuildUnitTest()

nnoremap <Leader><Leader>l :call GetLatestLog(0)<CR>
