return {
  "CopilotC-Nvim/CopilotChat.nvim",
  version = "^2",
  cmd = {
    "CopilotChat",
    "CopilotChatOpen",
    "CopilotChatClose",
    "CopilotChatToggle",
    "CopilotChatStop",
    "CopilotChatReset",
    "CopilotChatSave",
    "CopilotChatLoad",
    "CopilotChatDebugInfo",
    "CopilotChatModels",
    "CopilotChatExplain",
    "CopilotChatReview",
    "CopilotChatFix",
    "CopilotChatOptimize",
    "CopilotChatDocs",
    "CopilotChatFixDiagnostic",
    "CopilotChatCommit",
    "CopilotChatCommitStaged",
  },
  dependencies = {
    {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      event = "InsertEnter",
      config = function()
        require("copilot").setup({
          suggestion = {
            auto_trigger = true,
          },
        })
      end,
    },
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim" },
  },
  opts = function()
    local user = vim.env.USER or "User"
    user = user:sub(1, 1):upper() .. user:sub(2)
    return {
      model = "gpt-4o",
      auto_insert_mode = true,
      show_help = true,
      question_header = "  " .. user .. " ",
      answer_header = "  Copilot ",
      window = {
        layout = "float",
        width = 74, -- absolute width in columns
        height = vim.o.lines - 4, -- absolute height in rows, subtract for command line and status line
        row = 1, -- row position of the window, starting from the top
        col = vim.o.columns - 74, -- column position of the window, aligned to the right
      },
      selection = function(source)
        local select = require("CopilotChat.select")
        return select.visual(source) or select.buffer(source)
      end,
    }
  end,
  keys = {
    { "<c-s>", "<CR>", ft = "copilot-chat", desc = "Submit Prompt", remap = true },
    { "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
    {
      "<leader>aa",
      function()
        return require("CopilotChat").toggle()
      end,
      desc = "Toggle (CopilotChat)",
      mode = { "n", "v" },
    },
    {
      "<leader>ax",
      function()
        return require("CopilotChat").reset()
      end,
      desc = "Clear (CopilotChat)",
      mode = { "n", "v" },
    },
    {
      "<leader>aq",
      function()
        vim.ui.input({ prompt = "Quick Chat: " }, function(input)
          if input ~= nil and input ~= "" then
            require("CopilotChat").ask(input)
          end
        end)
      end,
      desc = "Quick Chat (CopilotChat)",
      mode = { "n", "v" },
    },
    {
      "<leader>ad",
      function()
        local actions = require("CopilotChat.actions")
        require("CopilotChat.integrations.telescope").pick(actions.help_actions())
      end,
      desc = "CopilotChat - Help actions",
    },
    -- Show prompts actions with telescope
    {
      "<leader>ap",
      function()
        local actions = require("CopilotChat.actions")
        require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
      end,
      desc = "CopilotChat - Prompt actions",
    },
    {
      "<leader>aS",
      function()
        vim.ui.input({ prompt = "Save Chat: " }, function(input)
          if input ~= nil and input ~= "" then
            require("CopilotChat").save(input)
          end
        end)
      end,
      desc = "Save Chat",
    },
    {
      "<leader>aL",
      function()
        local copilot_chat = require("CopilotChat")
        local path = copilot_chat.config.history_path
        local chats = require("plenary.scandir").scan_dir(path, { depth = 1, hidden = true })
        -- Remove the path from the chat names and .json
        for i, chat in ipairs(chats) do
          chats[i] = chat:sub(#path + 2, -6)
        end
        vim.ui.select(chats, { prompt = "Load Chat: " }, function(selected)
          if selected ~= nil and selected ~= "" then
            copilot_chat.load(selected)
          end
        end)
      end,
      desc = "Load Chat",
    },
  },
  config = function(_, opts)
    local chat = require("CopilotChat")
    require("CopilotChat.integrations.cmp").setup()

    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "copilot-chat",
      callback = function()
        vim.opt_local.relativenumber = false
        vim.opt_local.number = false
      end,
    })

    chat.setup(opts)
  end,
}
