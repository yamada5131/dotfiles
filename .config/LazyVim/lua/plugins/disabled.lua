local plugins = {
  "lualine.nvim",
  "bufferline.nvim",
  "mini.ai",
  "catppuccin/nvim",
  "nvim-neo-tree/neo-tree.nvim",
  "MagicDuck/grug-far.nvim",
  "folke/flash.nvim",
  -- "folke/which-key.nvim",
  "windwp/nvim-ts-autotag",
  "rcarriga/nvim-notify",
  "lukas-reineke/indent-blankline.nvim",
  "folke/noice.nvim",
  "echasnovski/mini.icons",
  -- "MunifTanjim/nui.nvim", --need for laravel.nvim
  "nvimdev/dashboard-nvim",
  "folke/persistence.nvim",
  "mini.pairs",
}

local result = {}
for _, plugin in ipairs(plugins) do
  table.insert(result, { plugin, enabled = false })
end

return result
