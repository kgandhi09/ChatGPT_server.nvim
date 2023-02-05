local chatgpt_ui = {}

local api = vim.api
local win_id = api.nvim_get_current_win()
local buf_id = api.nvim_win_get_buf(win_id)
local line_count = api.nvim_buf_line_count(buf_id)

local win_width, win_height = api.nvim_win_get_width(win_id), api.nvim_win_get_height(win_id)
local row, col = api.nvim_win_get_cursor(win_id)

local welcome_message = {
  "  /\\  ",
  " /  \\ ",
  "< A.I.> at your service!",
  " \\  / ",
  "  \\/  ",
}


function chatgpt_ui.window_ui()
    local new_win = api.nvim_open_win(0, true, {
        width = win_width / 2,
        height = win_height / 2,
        relative = "editor",
        row = win_height / 4,
        col = win_width / 4,})
    api.nvim_command("enew")
    local buf = api.nvim_get_current_buf()
    
    vim.wo.number = false
    api.nvim_buf_set_lines(buf, 0, -1, false, welcome_message)

    local line_count = api.nvim_buf_line_count(buf)
    -- Add two lines to the buffer to make room for the prompt

    api.nvim_buf_set_lines(buf, line_count, line_count+1, false, {"", ""})

    -- Set the cursor position after the welocme message
    api.nvim_win_set_cursor(new_win, {line_count + 1, 0})
end


function chatgpt_ui.close_win()
    vim.api.nvim_win_close(0, true)
end

return chatgpt_ui
