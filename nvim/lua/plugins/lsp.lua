return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        rust_analyzer = {
          cmd = { "rust-analyzer" }, -- use system binary
        },
      },
    },
  },
}
