-- Leader key is a space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set up the globals
-- See ./lua/globals
require "globals.options"
require "globals.remaps"

-- See ./lua/plugins
require "plugins.packer-config"
require "plugins.telescope-config"
require "plugins.gruvbox-config"

-- See ./lua/lsp
require "lsp.lsp"



-- Automatically run PackerSync if the packer file changes.
local group = vim.api.nvim_create_augroup("packer_user_config", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	command = "luafile <afile> | PackerSync",
	pattern = "packer.lua", -- the name of your plugins file
	group = group,
})
