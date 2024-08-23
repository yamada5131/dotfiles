return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- vim.keymap.set({mode}, {lhs}, {rhs}, {opts})
        n = {
          ["<C-u>"] = { "<C-u>zz", desc = "Move down and center cursor" },
          ["<C-d>"] = { "<C-d>zz", desc = "Move up and center cursor" },
          ["<C-a>"] = { "ggVG", desc = "Selec all" },
          -- ["<Leader>ff"] = {
          --   function() require("telescope.builtin").find_files { hidden = true, no_ignore = false } end,
          --   desc = "Find files overriden",
          -- },
        },
        t = {},
      },
    },
  },
}
