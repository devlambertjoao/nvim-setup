local status, toggleterm = pcall(require, "toggleterm")
if (not status) then return end

-- Windows specific configuration
if os.getenv("NEOVIM_OS_RUNNING") == "WINDOWS"
then
  vim.opt.shell = vim.fn.executable "pwsh" and "pwsh" or "powershell"
  vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
  vim.opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
  vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
  vim.opt.shellquote = ""
  vim.opt.shellxquote = ""
end

-- Mapping
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

toggleterm.setup({
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<leader>ta]],
  hide_numbers = true,
  start_in_insert = true,
  insert_mappings = true,
  terminal_mappings = true,
  persist_size = true,
  persist_mode = true,
  direction = 'vertical',
  close_on_exit = true,
  auto_scroll = true,
})


---- Custom Terminals
-- Create a global function and register with whichkey

-- Lazygit
local lazygit = require('toggleterm.terminal').Terminal:new({ cmd = "lazygit", hidden = true, direction = 'float' })
function Lazygit_toggle()
  lazygit:toggle()
end
