augroup fortran_config

    setlocal autoindent shiftwidth=2 expandtab
    setlocal indentkeys=o,O,*<Return>,!^F

    let s:extfname = expand("%:e")
    if s:extfname ==? "f90"
        let fortran_free_source=1
        unlet! fortran_fixed_source
    else
        let fortran_fixed_source=1
        unlet! fortran_free_source
    endif


augroup END
