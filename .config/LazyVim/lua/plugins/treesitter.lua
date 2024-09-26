return {
  -- Add a Treesitter parser for Laravel Blade to provide Blade syntax highlighting.
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "blade",
      "php_only",
      "php",
      "phpdoc",
      "hyprlang",
      "html",
      "css",
    },
  },
  config = function(_, opts)
    vim.filetype.add({
      pattern = {
        [".*%.blade%.php"] = "blade",
      },
    })

    require("nvim-treesitter.configs").setup(opts)

    ---@class parser_config
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

    parser_config.blade = {
      install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = { "src/parser.c" },
        branch = "main",
      },
      filetype = "blade",
    }
  end,
}
