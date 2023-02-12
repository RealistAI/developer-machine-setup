vim.api.nvim_set_keymap('i', 'kj', '<ESC>', { noremap = true }) -- make 'kj' exit

-- Telescope Mappings
vim.api.nvim_set_keymap('n', '<C-/>', "<cmd>lua require('plugins.telescope-config').current_buff()<cr>", { noremap = true })
vim.api.nvim_set_keymap('n', '<space>fd', "<cmd>lua require('plugins.telescope-config').find_files()<cr>", { noremap = true })
