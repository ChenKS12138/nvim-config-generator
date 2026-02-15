require "nvchad.options"

-- add yours here!
vim.opt.autochdir = false

-- Neovide config
if vim.g.neovide then
  vim.g.neovide_input_macos_option_key_is_meta = "both"
  vim.g.neovide_scale_factor = 1.0
  vim.g.neovide_scroll_animation_length = 0.3
end

-- Horizontal scrolling
vim.opt.wrap = false
vim.opt.sidescrolloff = 8
vim.opt.sidescroll = 1
vim.opt.mouse = "a"

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
