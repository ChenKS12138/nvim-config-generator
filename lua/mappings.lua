require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>fm", function()
  require("conform").format()
end, { desc = "General Format file" })

map("n", "<leader>fg", "<cmd> Telescope lsp_document_symbols<CR>", { desc = "Telescope Find symbols" })

map("v", ">", ">gv", { desc = "Indent line" })

-- terminal
map({ "n", "t" }, "<A-h>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggle" }
end, { desc = "Terminal Toggle Horizontal" })

map({ "n", "t" }, "<M-h>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggle" }
end, { desc = "Terminal Toggle Horizontal" })

map({ "n", "t" }, "<A-v>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggle" }
end, { desc = "Terminal Toggle Vertical" })

map({ "n", "t" }, "<M-v>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggle" }
end, { desc = "Terminal Toggle Vertical" })
