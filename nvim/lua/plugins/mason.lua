return {
  -- Mason for managing LSP servers
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    require("mason-lspconfig").setup({
      ensure_installed = {
        "pyright",    -- Python
        "lua_ls",     -- Lua
        -- "ruby_lsp",   -- Ruby (or "solargraph")
        "rust_analyzer", -- Rust
        "clangd",     -- C/C++
        "marksman",   -- Markdown
        "bashls",     -- Bash/zsh
        "jdtls",      -- Java
        -- "gopls",      -- Go
        "zls",        -- Zig
      },
      automatic_installation = false,
      handlers = {
        -- Default handler for all servers
        function(server_name)
          local lspconfig = require("lspconfig")
          local cmp_nvim_lsp = require("cmp_nvim_lsp")
          
          lspconfig[server_name].setup({
            capabilities = cmp_nvim_lsp.default_capabilities(),
          })
        end,
        -- Custom handler for pyright
        ["pyright"] = function()
          local lspconfig = require("lspconfig")
          local cmp_nvim_lsp = require("cmp_nvim_lsp")
          
          lspconfig.pyright.setup({
            capabilities = cmp_nvim_lsp.default_capabilities(),
            root_dir = lspconfig.util.find_git_ancestor
                or lspconfig.util.root_pattern("pyproject.toml",
                      "setup.py", "requirements.txt", "requirements.yml",
                      "requirements.yaml")
                or vim.fn.getcwd,
          })
        end,
      },
    })
  end,
}
