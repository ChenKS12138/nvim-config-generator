require "nvchad.autocmds"

local autotheme = require "configs.autotheme"

local function sync_theme()
  local theme = autotheme.get_theme()
  local last_theme_file = vim.fn.stdpath "data" .. "/last_theme"
  
  local f_read = io.open(last_theme_file, "r")
  local last_theme = f_read and f_read:read "*a" or ""
  if f_read then
    f_read:close()
  end

  local status, nvconfig = pcall(require, "nvconfig")
  if not status then
    return
  end

  -- If theme changed from last run or doesn't match current nvconfig
  if theme ~= last_theme or theme ~= nvconfig.base46.theme then
    nvconfig.base46.theme = theme
    vim.g.nvchad_theme = theme
    
    -- Update last_theme file
    local f_write = io.open(last_theme_file, "w")
    if f_write then
      f_write:write(theme)
      f_write:close()
    end

    -- Force re-compile and apply
    pcall(function()
      require("base46").load_all_highlights()
    end)
  end
end

-- Check on startup and when refocusing
vim.api.nvim_create_autocmd({ "VimEnter", "FocusGained" }, {
  callback = sync_theme,
})
