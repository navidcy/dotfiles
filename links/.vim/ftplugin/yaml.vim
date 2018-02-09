augroup yaml_config

    " Inspired by Ian Young's script
    setlocal autoindent shiftwidth=2 expandtab
    setlocal indentexpr=GetYamlIndent()
    setlocal indentkeys=o,O,*<Return>,!^F

    function! GetYamlIndent()
        let lnum = v:lnum - 1
        if lnum == 0
            return 0
        endif
        let line = substitute(getline(lnum),'\s\+$','','')
        let indent = indent(lnum)
        let increase = indent + &sw
        if line =~ ':$'
            return increase
        else
            return indent
        endif
    endfunction

augroup END
