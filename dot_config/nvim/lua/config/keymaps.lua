-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Opt + Backspace to delete a word backwards
vim.api.nvim_set_keymap('i', '<A-BS>', '<C-w>', { noremap = true, silent = true })

-- Opt + Left/Right to move between words
vim.api.nvim_set_keymap('i', '<A-Left>', '<C-Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-Right>', '<C-Right>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-Left>', '<C-Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-Right>', '<C-Right>', { noremap = true, silent = true })

-- Opt + Up/Down to move between paragraphs
vim.api.nvim_set_keymap('i', '<A-Up>', '<C-Up>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-Down>', '<C-Down>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-Up>', '<C-Up>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-Down>', '<C-Down>', { noremap = true, silent = true })

-- Cmd + Left/Right to move to the beginning/end of the line
vim.api.nvim_set_keymap('i', '<D-Left>', '0', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<D-Right>', '$', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<D-Left>', '0', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<D-Right>', '$', { noremap = true, silent = true })

-- Shift + Up/Down to move the line up or down
vim.api.nvim_set_keymap('n', '<S-Up>', ':m .-2<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Down>', ':m .+1<CR>==', { noremap = true, silent = true })

-- U to redo
vim.api.nvim_set_keymap('n', 'U', '<C-r>', { noremap = true, silent = true })

-- Rust
local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set(
  "n",
  "K",  -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
  function()
    vim.cmd.RustLsp({'hover', 'actions'})
  end,
  { silent = true, buffer = bufnr }
)
