-- This is just to get auto indent to work properly on c sharp :)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cs",
  callback = function()
    vim.opt_local.indentexpr = ""     -- clear treesitter/ftplugin indentexpr so smartindent can take over
    vim.opt_local.cindent = false     -- make sure cindent isn't also stealing priority
    vim.opt_local.smartindent = true
  end,
})
