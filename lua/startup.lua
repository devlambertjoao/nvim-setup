-- Vim_enter = function()
--   vim.cmd [[ enew ]]
--
--   vim.cmd [[
--       set local
--         \ bufhidden=wipe
--         \ buftype=nofile
--         \ nobuflisted
--         \ nocursorcolumn
--         \ nocursorline
--         \ nolist
--         \ nonumber
--         \ noswapfile
--         \ norelativenumber
--     ]]
--
--   -- vim.cmd [[ call append('$', "") ]]
--
--   -- vim.cmd [[ for line in split(system('fortune -a'), '\n')
--   --     call append('$', '        ' . l:line)
--   -- endfor ]]
--
--   -- vim.cmd[[setlocal nomodifiable nomodified]]
--
--   -- nnoremap <buffer><silent> e :enew<CR>
--   -- nnoremap <buffer><silent> i :enew <bar> startinsert<CR>
--   -- nnoremap <buffer><silent> o :enew <bar> startinsert<CR>
-- end
--
-- vim.api.nvim_exec(
--   [[ autocmd VimEnter * ++nested ++once Vim_enter() ]],
--   false
-- )
--
-- return { Vim_enter() }

vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  nested = true,
  callback = function()
    vim.api.nvim_buf_set_keymap(0, "n", "b", "<cmd>NvimTreeFindFileToggle<CR>", {})
  end,
})
