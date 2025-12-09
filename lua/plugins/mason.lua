return {
    "mason-org/mason.nvim",
    event = "VeryLazy",
    dependencies = {
        "mason-org/mason-lspconfig.nvim",
    },
    opts = {},
    config = function (_, opts)
        require("mason").setup(opts)
        local registry = require "mason-registry"

        local success, package = pcall(registry.get_package, "lua-language-server")
        if success and not package:is_installed() then
            package:install()
        end
        vim.cmd("LspStart")
    end,
}