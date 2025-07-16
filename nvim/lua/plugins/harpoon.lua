return {
    'ThePrimeagen/harpoon',
    branch = "harpoon2",
    requires = {
        {"nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"}
    },
    config = function()
        local harpoon = require("harpoon")

        -- REQUIRED
        harpoon:setup()

        -- REQUIRED
        vim.keymap.set("n", "<leader>add", function() harpoon:list():add() end)
        vim.keymap.set("n", "<leader>rem", function() harpoon:list():remove() end)
        vim.keymap.set("n", "<M-e>", function()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end)

        vim.keymap.set("n", "<M-y>", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<M-u>", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<M-i>", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<M-o>", function() harpoon:list():select(4) end)

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<M-t>", function() harpoon:list():prev() end)
        vim.keymap.set("n", "<M-p>", function() harpoon:list():next() end)
    end
}
