-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.colorscheme.rose-pine" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.hyprlang" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.laravel" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.completion.copilot-cmp" },
  { import = "astrocommunity.indent.mini-indentscope" },
  { import = "astrocommunity.recipes.telescope-lsp-mappings" },
  { import = "astrocommunity.workflow.hardtime-nvim" },
  { import = "astrocommunity.media.codesnap-nvim" },
  { import = "astrocommunity.comment.ts-comments-nvim" },
  { import = "astrocommunity.icon.mini-icons" },
}
