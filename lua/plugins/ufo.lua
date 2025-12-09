return {
    "kevinhwang91/nvim-ufo",
    dependencies = {
        "kevinhwang91/promise-async",
    },
    event = "VeryLazy",
    opts = {
        preview = {
            win_config = {
                border = "rounded",
                winhighlight = "Normal:Folded",
                winblend = 0,
            },
        },
    },
    config = function(_, opts)
        vim.opt.foldenable = true

        require("ufo").setup(opts)
    end,
    keys = {
        {
            "zR",
            function()
                require("ufo").openAllFolds()
            end,
            desc = "Open all folds",
        },
        {
            "zM",
            function()
                require("ufo").closeAllFolds()
            end,
            desc = "Close all folds",
        },
        {
            "zp",
            function()
                require("ufo").peekFoldedLinesUnderCursor()
            end,
            desc = "Preview folded content",
        },
    },
}