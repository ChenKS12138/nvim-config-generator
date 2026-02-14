require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>fm", function()
  require("conform").format()
end, { desc = "General Format file" })

map("n", "<leader>fg", "<cmd> Telescope lsp_document_symbols<CR>", { desc = "Telescope Find symbols" })

map("n", "<leader>uw", function()
  vim.opt.wrap = not vim.opt.wrap:get()
  print("Word Wrap: " .. (vim.opt.wrap:get() and "ON" or "OFF"))
end, { desc = "Toggle Word Wrap" })

map("v", ">", ">gv", { desc = "Indent line" })

-- Diffview
map("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "Git Diffview Open" })
map("n", "<leader>gD", "<cmd>DiffviewClose<CR>", { desc = "Git Diffview Close" })
map("n", "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", { desc = "Git File History" })
map("n", "<leader>gH", "<cmd>DiffviewFileHistory<CR>", { desc = "Git Project History" })

-- terminal
local function toggle_term(opts, target_size)
  require("nvchad.term").toggle(opts)
  
  -- Use defer_fn to ensure it runs after NvChad's own window logic
  vim.defer_fn(function()
    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
      if vim.api.nvim_win_is_valid(win) then
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.b[buf].term_id == opts.id then
          if opts.pos == "sp" then
            vim.api.nvim_win_set_height(win, target_size)
          else
            vim.api.nvim_win_set_width(win, target_size)
          end
          break
        end
      end
    end
  end, 50)
end

map({ "n", "t" }, "<A-h>", function()
  toggle_term({ pos = "sp", id = "htoggle" }, 15)
end, { desc = "Terminal Toggle Horizontal" })

map({ "n", "t" }, "<M-h>", function()
  toggle_term({ pos = "sp", id = "htoggle" }, 15)
end, { desc = "Terminal Toggle Horizontal" })

map({ "n", "t" }, "<A-v>", function()
  toggle_term({ pos = "vsp", id = "vtoggle" }, 100)
end, { desc = "Terminal Toggle Vertical" })

map({ "n", "t" }, "<M-v>", function()
  toggle_term({ pos = "vsp", id = "vtoggle" }, 100)
end, { desc = "Terminal Toggle Vertical" })

-- Neovide zoom
if vim.g.neovide then
  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end

  map("n", "<D-=>", function()
    change_scale_factor(1.1)
  end, { desc = "Neovide Zoom In" })
  map("n", "<D-->", function()
    change_scale_factor(0.9)
  end, { desc = "Neovide Zoom Out" })
  map("n", "<D-0>", function()
    vim.g.neovide_scale_factor = 1.0
  end, { desc = "Neovide Reset Zoom" })
end
