return {
  {
    -- Add the Laravel.nvim plugin which gives the ability to run Artisan commands
    -- from Neovim.
    "adalessa/laravel.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "tpope/vim-dotenv",
      "MunifTanjim/nui.nvim",
    },
    cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
    keys = {
      { "<leader>La", ":Laravel artisan<cr>", desc = "Artisan" },
      { "<leader>Lr", ":Laravel routes<cr>", desc = "Routes" },
      { "<leader>Lc", ":Composer<CR>", desc = "Composer" },
      { "<leader>Ln", ":Npm<CR>", desc = "Npm" },
      { "<leader>Ly", ":Yarn<CR>", desc = "Yarn" },
    },
    event = { "VeryLazy" },
    config = true,
    opts = {
      lsp_server = "intelephense",
      features = { null_ls = { enable = false } },
    },
  },
  {
    "Bleksak/laravel-ide-helper.nvim",
    opts = {
      write_to_models = true,
      save_before_write = true,
      format_after_gen = true,
    },
    enabled = function()
      return vim.fn.filereadable("artisan") ~= 0
    end,
    keys = {
      {
        "<leader>hm",
        function()
          require("laravel-ide-helper").generate_models(vim.fn.expand("%"))
        end,
        desc = "Generate Model Info for current model",
      },
      {
        "<leader>hM",
        function()
          require("laravel-ide-helper").generate_models()
        end,
        desc = "Generate Model Info for all models",
      },
    },
  },
}
