-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Move up and down with ctrl + y/d and center the cursor
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "<C-d>", "<C-d>zz")

keymap.set("n", "<leader>e", vim.cmd.Ex)
