return {
    "gbprod/yanky.nvim",
    opts = {
        ring = {
            history_length = 100,
            storage = "shada", -- persists history between sessions
        },
        system_clipboard = {
            sync_with_ring = true,
        },
        highlight = {
            on_put = true, -- briefly highlight what you just pasted
            on_yank = true,
            timer = 200,
        },
    },
    keys = {
        -- Better p and P that allow cycling through history
        { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" } },
        { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" } },
        { "<c-n>", "<Plug>(YankyCycleForward)", desc = "Cycle forward in yank history" },
        { "<c-p>", "<Plug>(YankyCycleBackward)", desc = "Cycle backward in yank history" },
    },
}
