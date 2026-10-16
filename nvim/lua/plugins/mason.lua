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

        -- Non-LSP tools: install if missing
        local registry = require("mason-registry")
        registry.refresh(function()
            local pkg = registry.get_package("mypy")
            if not pkg:is_installed() then pkg:install() end
        end)

        -- Applies to every server
        vim.lsp.config("*", {
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
        })

        vim.lsp.config("pyright", {
            root_markers = {
                "pyproject.toml", "setup.py", "requirements.txt",
                "requirements.yaml", "requirements.yml", ".git",
            },
        })

        -- Prefer the active conda env's binary; nil if absent
        local function conda_bin(name)
            local prefix = vim.env.CONDA_PREFIX
            local path = prefix and (prefix .. "/bin/" .. name)
            if path and vim.fn.executable(path) == 1 then return path end
        end

        vim.lsp.config("ruff", {
            -- This is for the stupid stats framework
            -- cmd = { conda_bin("ruff") or "ruff", "server", --preview },
            -- cmd = { conda_bin("ruff") or "ruff", "server" },
            cmd = { "ruff", "server" },
        })

        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } },
                    workspace = {
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
        })

        require("mason-lspconfig").setup({
            ensure_installed = {
                "pyright",       -- Python
                "ruff",          -- Python
                "lua_ls",        -- Lua
                -- "ruby_lsp",   -- Ruby (or "solargraph")
                "rust_analyzer", -- Rust
                "clangd",        -- C/C++
                "marksman",      -- Markdown
                "bashls",        -- Bash/zsh
            },
            -- automatic_enable = { exclude = { "ruff" } },
            automatic_enable = { "pyright", "ruff", "bashls" },
        })
    end,
}
