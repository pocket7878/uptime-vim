if exists('g:loaded_uptime')
	finish
endif

let s:start_time = localtime()
let g:loaded_hello = 1

function! Uptime()
	let l:currentTime = localtime() - g:start_time
	let l:year = l:currentTime/31536000
	let l:month = (l:currentTime%31536000)/2592000
	let l:day = ((l:currentTime%31536000)%2592000)/86400
	let l:hour = (((l:currentTime%31536000)%2592000)%86400)/3600
	let l:minutes = ((((l:currentTime%31536000)%2592000)%86400)%3600)/60
	let l:second = (((((l:currentTime%31536000)%2592000)%86400)%3600)%60)

	let l:timeMsg = ""
	if l:year != 0 
		let l:timeMsg = l:timeMsg . l:year . '/'
	endif
	if (l:month != 0) 
		let l:timeMsg = l:timeMsg . l:month . '/'
	endif
	if (l:day != 0) 
		let l:timeMsg = l:timeMsg . l:day . " "
	endif	
	let l:timeMsg = l:timeMsg . l:hour . ":" . l:minutes . ":" . l:second
	echo l:timeMsg
endfunction

command! -nargs=0 -bar Uptime
\	call Uptime()
