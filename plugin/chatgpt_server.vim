python from chatgpt_vim import chatgpt
lua chatgpt_ui_ = dofile(vim.fn.expand('/home/gandhi/.local/share/nvim/plugged/ChatGPT_server.nvim/autoload/chatgpt_ui.lua'))

function StartChatGptWin()
    lua chatgpt_ui_.window_ui()
endfunction

function CloseChatGptWin()
    lua chatgpt_ui_.close_win()
endfunction

function GetInput()
    let input = input(": What's driving you today? ")
    return input
endfunction

:command! -nargs=0 ChatGpt call StartChatGptWin()
let input = GetInput()


:command! -nargs=0 ChatGptClose call CloseChatGptWin()
