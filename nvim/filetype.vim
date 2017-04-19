" user filetype file
if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect

au! BufNewFile,BufRead *.applescript,*.AppleScript   setf applescript

augroup END
