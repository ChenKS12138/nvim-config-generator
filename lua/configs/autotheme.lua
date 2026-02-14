local M = {}

M.get_theme = function()
  local handle = io.popen "defaults read -g AppleInterfaceStyle 2>/dev/null"
  local result = ""
  if handle then
    result = handle:read "*a" or ""
    handle:close()
  end

  if result and result:match "Dark" then
    return "ayu_dark"
  else
    return "one_light"
  end
end

return M
