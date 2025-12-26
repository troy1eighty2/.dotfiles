local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}
vim.keymap.set("n", "<leader>e", function()
  require("snacks").explorer.open()
end, { desc = "Snacks Explorer" })

-- telescope
vim.keymap.set("n", "<leader><space>", function() require('telescope.builtin').find_files() end, {})
vim.keymap.set("n", "<leader>g", function() require('telescope.builtin').git_files() end, {})
vim.keymap.set("n", "<leader>/", function() require('telescope.builtin').live_grep() end, {})
vim.keymap.set("n", "<leader>c", function()
  local cwd = vim.fn.expand("~/.dotfiles/.config/nvim")
  require('telescope.builtin').find_files({
    cwd = cwd,
    hidden = true,     -- show dotfiles
    no_ignore = true,  -- ignore .gitignore/global ignores
    follow = true,     -- follow symlinks
  })
end)
vim.keymap.set("n", "<leader>r", function() require('telescope.builtin').buffers() end, {})

--harpoon
vim.keymap.set("n", "<leader>a", function() require('harpoon'):list():add() end)
vim.keymap.set("n", "<leader>h", function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end)
vim.keymap.set("n", "<leader>1", function() require('harpoon'):list():select(1) end)
vim.keymap.set("n", "<leader>2", function() require('harpoon'):list():select(2) end)
vim.keymap.set("n", "<leader>3", function() require('harpoon'):list():select(3) end)
vim.keymap.set("n", "<leader>4", function() require('harpoon'):list():select(4) end)
vim.keymap.set("n", "<leader>5", function() require('harpoon'):list():select(5) end)

vim.api.nvim_create_autocmd({'BufEnter'},{
    callback = function()
        vim.api.nvim_command("Screenkey")
    end
})
