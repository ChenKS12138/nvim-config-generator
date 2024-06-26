---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  nvdash = {
    load_on_startup = true,
    header = {
      " /\\     /\\            ",
      "{  `---'  }           ",
      "{  O   O  }           ",
      "~~>  V  <~~           ",
      " \\  \\|/  /            ",
      "  `-----'__           ",
      "  /     \\  `^\\_       ",
      " {       }\\ |\\_\\_   W ",
      " |  \\_/  |/ /  \\_\\_( )",
      "  \\__/  /(_E     \\__/ ",
      "    (  /              ",
      "     MM               "
    },
  },
  theme = "ayu_dark",
  theme_toggle = { "ayu_dark", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
