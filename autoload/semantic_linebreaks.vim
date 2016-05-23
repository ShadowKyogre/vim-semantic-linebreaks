function! semantic_linebreaks#asciidoc(preselect)
	if a:preselect > 0
		silent execute "normal! vipJ"
	endif
	let l:leading_indent = matchlist(getline('.'), '\v^(\s*)')
	let l:conjunctions = '<%(and|for|but|or|yet|so)>'

	let l:regexps = join([
		\ '[.!?,]"%(__)?',
		\ '[!?,;]',
		\ ',%( ' . l:conjunctions . ')@!',
		\ '%(%(^|[ "])M%(rs?|s)|^\.*)@<!\.',
		\ '\?!',
		\ '!\?',
		\ '%(, )@<!' . l:conjunctions,
	\ ], '|')

	silent execute "'<,'>" . 's/\v(' . l:regexps . ')\zs /\r' . escape(l:leading_indent[0], "\t") . '/g'
endfunction
