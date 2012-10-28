" LaTeX filetype
"	  Language: LaTeX (ft=tex)
"	Maintainer: Srinath Avadhanula
"		 Email: srinath@fastmail.fm

if !exists('s:initLatexSuite')
	let s:initLatexSuite = 1
	exec 'so '.fnameescape(expand('<sfile>:p:h').'/latex-suite/main.vim')

	silent! do LatexSuite User LatexSuiteInitPost
endif

silent! do LatexSuite User LatexSuiteFileType

"" Run LaTeX through TexShop
"function! SRJ_runLatex()
"  if &ft != 'tex'
"    echo "calling srj_runLatex from a non-tex file"
"    return ''
"  end
"
"  "write the file
"  :w
"
"  let thePath = getcwd() . '/'. expand("%")
"  
"  exec 'silent! !'.execString
"  return ''
"endfunction
"no  <expr> <D-r> SRJ_runLatex()
"vn  <expr> <D-r> SRJ_runLatex()
"ino <expr> <D-r> SRJ_runLatex()
"

