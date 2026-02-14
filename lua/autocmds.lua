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

-- Change directory to the one passed as an argument
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() > 0 then
      local arg = vim.fn.argv(0)
      if vim.fn.isdirectory(arg) == 1 then
        vim.api.nvim_set_current_dir(arg)
      end
    end
  end,
})

vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format { async = true, lsp_fallback = true, range = range }
end, { range = true })
