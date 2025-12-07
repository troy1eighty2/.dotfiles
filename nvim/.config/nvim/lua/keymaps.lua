vim.keymap.set("n", "<leader>e", function()
  local bufname = vim.api.nvim_buf_get_name(0)
  local filetype = vim.bo.filetype

  if filetype == "netrw" or bufname:match("NetrwTreeListing") then
    -- Close netrw buffer
    vim.cmd("bd")
  else
    -- Open netrw in current working dir
    vim.cmd("Ex")
  end
end)
vim.keymap.set('n', '<leader>s"', "<cmd>split<CR>" )
vim.keymap.set('n', "<leader>s%", "<cmd>vsplit<CR>" )
vim.keymap.set('n', "<leader>sh", "<C-w>h" )
vim.keymap.set('n', "<leader>sj", "<C-w>j" )
vim.keymap.set('n', "<leader>sk", "<C-w>k" )
vim.keymap.set('n', "<leader>sl", "<C-w>l" )



-- diagnostics
vim.diagnostic.config({
  virtual_text ={ severity = { min = vim.diagnostic.severity.ERROR } },   -- enable inline messages
  signs = true,          -- keep the gutter symbols
  underline = true,      -- underline problematic text
})


-- fugitive keymaps
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

-- telescope keymaps
local builtin = require "telescope.builtin"
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
vim.keymap.set("n", "<leader>/", builtin.live_grep, {})

vim.keymap.set("n", "<leader><space>", builtin.find_files, {})
vim.keymap.set("n", "<leader>c", function()
  local cwd = vim.fn.expand("~/.dotfiles/nvim")
  builtin.find_files({
    cwd = cwd,
    hidden = true,     -- show dotfiles
    no_ignore = true,  -- ignore .gitignore/global ignores
    follow = true,     -- follow symlinks
  })
end)
vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
vim.keymap.set("n", "<leader>/", builtin.live_grep, {})
vim.keymap.set("n", "<leader>r", builtin.buffers, {})


-- harpoon keymaps
local mark = require "harpoon.mark"
local ui = require "harpoon.ui"
local term = require "harpoon.term"
vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu, {})
vim.keymap.set("n", "<leader>a", mark.add_file, {})
vim.keymap.set("n", "<C-j>", ui.nav_next, {})
vim.keymap.set("n", "<C-k>", ui.nav_prev, {})
vim.keymap.set("n", "<C-t>", function()
  local cur_win = vim.api.nvim_get_current_win()
  vim.cmd("split")
  local new_win = vim.api.nvim_get_current_win()
  vim.api.nvim_set_current_win(cur_win)
  term.gotoTerminal(1)
  vim.api.nvim_input("i")
end)
vim.keymap.set('t', "<C-t>", "<C-\\><C-n>" )

-- zoom keymaps
vim.keymap.set('n', '<leader>sz', ':SimpleZoomToggle<CR>')
