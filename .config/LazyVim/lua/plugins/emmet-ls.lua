return {
  "aca/emmet-ls",
  configs = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
  end,
}
