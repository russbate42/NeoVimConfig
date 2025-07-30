return { "nvim-telescope/telescope-bibtex.nvim",
  requires = {
    {'nvim-telescope/telescope.nvim'}
  },
  config = function()
    local tel = require("telescope")
    tel.load_extension("bibtex")

    vim.keymap.set("n", "<leader>bi", ":Telescope bibtex<CR>")

    -- Configure actions
    local bibtex_actions = require('telescope-bibtex.actions')
  end
}
