local M = {
  "neovim/nvim-lspconfig",
  config = function()
    vim.lsp.config('*', {
      root_markers = { '.git' },
    })
    vim.lsp.config('ts_ls', {
      cmd = { 'typescript-language-server', '--stdio' },
      filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
    })
    vim.lsp.enable('ts_ls')
  end
}
return M

