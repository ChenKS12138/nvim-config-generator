local M = {}

-- Function to get the current macOS appearance
function M.get_macos_appearance()
  local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
  if not handle then
    return "Light"
  end
  local result = handle:read("*a")
  handle:close()

  if result and result:match("Dark") then
    return "Dark"
  else
    return "Light"
  end
end

-- Function to switch the theme
function M.switch_theme()
  local mode = M.get_macos_appearance()
  local expected_theme = "one_light"

  if mode == "Dark" then
    expected_theme = "ayu_dark"
  end

  -- Only reload if the theme is different
  if vim.g.nvchad_theme ~= expected_theme then
    -- Update the global variable
    vim.g.nvchad_theme = expected_theme
    
    -- Reload base46 highlights to apply the new theme
    -- We use pcall to avoid errors if base46 is not yet loaded or available
    local status, base46 = pcall(require, "base46")
    if status then
      base46.load_all_highlights()
    end
  end
end

return M
