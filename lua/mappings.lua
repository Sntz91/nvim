vim.g.mapleader = " "
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>")
vim.keymap.set("n", "<leader>r", "<cmd>source $MYVIMRC<cr>")

-- Directory change
vim.keymap.set("n", "<leader>pv", "<cmd>Ex<cr>")
vim.keymap.set("n", "<leader>p|", "<cmd>Vex<cr>")
vim.keymap.set("n", "<leader>p-", "<cmd>Sex<cr>")

-- Copy paste global register
vim.keymap.set({ "n", "x" }, "gy", '"+y')
vim.keymap.set({ "n", "x" }, "gp", '"+p')

-- don't copy with x
vim.keymap.set({ "n", "x" }, "x", '"_x')
vim.keymap.set({ "n", "x" }, "X", '"_d')


local function get_visual_selection()
  local s_start = vim.fn.getpos("'<")
  local s_end = vim.fn.getpos("'>")
  local n_lines = math.abs(s_end[2] - s_start[2]) + 1
  local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
  lines[1] = string.sub(lines[1], s_start[3], -1)
  if n_lines == 1 then
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
  else
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
  end
  -- Remove tab characters
  --for i, line in ipairs(lines) do
    --lines[i] = line:gsub("[\t\n]", "")
  --end
  --return table.concat(lines, '\n')
  local selection = table.concat(lines)
  selection = selection:gsub("[\t\n]", "")
  return selection
end


local function open_text_in_split(text)
    -- Create a new split below the current window
    vim.cmd('botright vnew')
    vim.cmd('vertical resize 85')
    -- Set the scratch buffer to use 'nofile' and 'buftype=nofile'
    vim.bo[0].bufhidden = 'hide'
    vim.bo[0].swapfile = false
    vim.bo[0].buftype = 'nofile'
    vim.bo[0].filetype = 'plaintext' -- Change this to desired filetype if necessary
    -- Put the provided text in the new buffer
	for line in text:gmatch("[^\r\n]+") do
		vim.api.nvim_put({line}, 'l', true, true)
    end
    -- Go to the start of the buffer
    vim.cmd('normal! gg')
end

function hello()
	-- local input = vim.fn.input("?")
	local selection = get_visual_selection()
	local input = "Rewrite the following sentences: " .. selection
	if input == '' then
		print("Need an input mate")
	end
	local command = 'python $HOME/Projects/sentence-rewriting/main.py "' .. input .. '"'

    local handle = io.popen(command)
    local result = handle:read("*all")
    handle:close()
	-- result = addNewlines(result, 80)
	open_text_in_split(result)
end

-- vim.keymap.set("v", "<leader>l", ':lua hello()<CR>')
-- vim.keymap.set("v", "<leader>l", ':lua rewrite()<CR>')
-- vim.keymap.set("v", "<leader>z", ':lua print(vim.inspect(getVisualSelection()))<CR>')
