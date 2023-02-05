local http = require("socket.http")
local ltn12 = require("ltn12")

function chatgpt()
  local current_buffer = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local response_body = {}

  local request_body = string.format('{"prompt": "%s"}', table.concat(current_buffer, "\\n"))
  local response, status, headers = http.request{
    url = "http://localhost:8000/model/generate",
    method = "POST",
    headers = {
      ["Content-Type"] = "application/json"
    },
    source = ltn12.source.string(request_body),
    sink = ltn12.sink.table(response_body)
  }

  local response_text = table.concat(response_body)
  vim.api.nvim_command("new ChatGPT")
  local chatgpt_buf = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_set_lines(chatgpt_buf, 0, -1, false, response_text)
end

vim.api.nvim_command("command! ChatGPT lua require('chatgpt').chatgpt()")

