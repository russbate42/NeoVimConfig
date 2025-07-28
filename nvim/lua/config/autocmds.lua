
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


-- Treesitter folding for multiple languages
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python", "lua" },
  callback = function()
    local ft = vim.bo.filetype

    -- Check if treesitter folding is available
    local has_treesitter_fold = pcall(function()
      return vim.fn.exists('*nvim_treesitter#foldexpr') == 1
    end)

    if has_treesitter_fold then
      -- Use Treesitter folding
      vim.opt_local.foldmethod = 'expr'
      vim.opt_local.foldexpr = 'nvim_treesitter#foldexpr()'
      
      -- Set language-specific fold levels
      if ft == "python" then
        vim.opt_local.foldlevelstart = 2
      else
        vim.opt_local.foldlevelstart = 1
      end
    else
      -- Fallback to indent folding
      vim.opt_local.foldmethod = 'indent'
      
      -- Adjust indent folding settings per language
      if ft == "python" then
        vim.opt_local.foldlevelstart = 2
        vim.opt_local.foldnestmax = 6
      elseif ft == "lua" then
        vim.opt_local.foldlevelstart = 1
        vim.opt_local.foldnestmax = 8
      else -- javascript
        vim.opt_local.foldlevelstart = 1
        vim.opt_local.foldnestmax = 10
      end
    end
  end,
})

-- Other autocommands...

