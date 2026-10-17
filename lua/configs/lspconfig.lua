-- 1. NvChad Standards laden
local nvchad_lsp = require("nvchad.configs.lspconfig")

-- 2. Globaler LspAttach Autocmd für Inlay Hints und NvChad Attach
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local bufnr = args.buf

    -- Standard NvChad Keymaps & Setup ausführen
    if nvchad_lsp.on_attach and client then
      nvchad_lsp.on_attach(client, bufnr)
    end

    -- Inlay Hints aktivieren, falls vom Server unterstützt
    if client and client:supports_method("textDocument/inlayHint") then
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end
  end,
})

-- 3. Deine Server-Liste
local servers = { "html", "cssls", "clangd", "ruff", "ty", "rust_analyzer" }

-- 4. Server mit der nativen Neovim 0.11+ API konfigurieren
for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    capabilities = nvchad_lsp.capabilities,
  })
  vim.lsp.enable(lsp)
end
