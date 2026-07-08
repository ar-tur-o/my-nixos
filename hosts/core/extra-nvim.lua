-- This is just to get auto indent to work properly on c sharp :)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cs",
  callback = function()
    vim.opt_local.indentexpr = ""     -- clear treesitter/ftplugin indentexpr so smartindent can take over
    vim.opt_local.cindent = false     -- make sure cindent isn't also stealing priority
    vim.opt_local.smartindent = true
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
  end,
})

vim.lsp.config("roslyn", {
  settings = {
    ["csharp|formatting"] = {
      dotnet_organize_imports_on_format = true,
    },
  },
})

vim.diagnostic.config({
  virtual_text = {
    severity = { min = vim.diagnostic.severity.WARN }, -- hide hints/info inline
    source = "if_many",
  },
  signs = true,
  underline = true,
  update_in_insert = false, -- don't recompute while you're actively typing
  severity_sort = true,
})

vim.keymap.set("n", "<leader>ci", vim.lsp.buf.code_action, { desc = "C# code actions" })
