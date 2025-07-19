
-- print("In VIM Autocommands")

-- Markdown
function MarkdownFold()
  local line = vim.fn.getline(vim.v.lnum)
  local level = string.match(line, "^#+")
  if level then
    return ">" .. #level
  end
  return "="
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.foldmethod = "expr"
    vim.opt_local.foldexpr = "MarkdownFold()"
    vim.opt_local.foldlevel = 1
  end,
})

