return {
  "startup-nvim/startup.nvim",
  dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-file-browser.nvim"
  },
  lazy = false,
  priority = 1500,
  config = function()
    -- startup = require("startup").setup({ theme="evil" })
    startup = require("startup").setup({ theme="dashboard" })
  end
}
