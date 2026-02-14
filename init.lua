vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- Determine theme early to check cache validity
local status, autotheme = pcall(require, "configs.autotheme")
local theme = status and autotheme.get_theme() or "one_light"
vim.g.nvchad_theme = theme

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- Only load theme cache if it matches the current desired theme
local last_theme_file = vim.fn.stdpath "data" .. "/last_theme"
local f = io.open(last_theme_file, "r")
local last_theme = f and f:read "*a" or ""
if f then
  f:close()
end

if theme == last_theme then
  pcall(function()
    dofile(vim.g.base46_cache .. "defaults")
    dofile(vim.g.base46_cache .. "statusline")
  end)
end

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)

