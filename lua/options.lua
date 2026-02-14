require "nvchad.options"

-- add yours here!
vim.opt.autochdir = true

-- Neovide config
if vim.g.neovide then
  vim.g.neovide_input_macos_option_key_is_meta = "both"
  vim.g.neovide_scale_factor = 1.0
end

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
