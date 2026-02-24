--Podstawy
vim.opt.tabstop = 2      -- Visual width of a tab
vim.opt.softtabstop = 2  -- Number of spaces a tab counts for while editing
vim.opt.shiftwidth = 2   -- Size of an indent (for the << and >> commands)
vim.opt.expandtab = true -- Turn tabs into spaces (highly recommended)
vim.opt.clipboard = "unnamedplus"
vim.g.mapleader = " "
vim.opt.number = true

--Lazy
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
-- Setup lazy.nvim
require("lazy").setup("plugins")
--Setupy
require("catppuccin").setup()
vim.cmd.colorscheme("catppuccin")
local builtin = require("telescope.builtin")
vim.keymap.set('n','<C-p>',builtin.find_files,{}) --ctrl p szukanie plików
vim.keymap.set('n','<leader>fg',builtin.live_grep,{}) --spacja fg szukanie w projekcie ale tekstu
vim.keymap.set('n','<C-n>',':Neotree filesystem reveal left <CR>')
