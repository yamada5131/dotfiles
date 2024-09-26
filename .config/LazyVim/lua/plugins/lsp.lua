return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pint",
        "php-cs-fixer",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- @type lspconfig.options
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "bit", "vim", "it", "describe", "before_each", "after_each", "have_make", "have_cmake" },
                -- undefined_global = false, -- remove this from diag!
                -- missing_parameters = false, -- missing fields :)
                -- disable = { "missing-parameters", "missing-fields" },
              },
            },
          },
        },
        intelephense = {
          filetypes = { "php", "blade", "php_only" },
          settings = {
            intelephense = {
              filetypes = { "php", "blade", "php_only" },
              files = {
                associations = { "*.php", "*.blade.php" }, -- Associating .blade.php files as well
                maxSize = 5000000,
              },
            },
          },
        },
      },
    },
  },
}
