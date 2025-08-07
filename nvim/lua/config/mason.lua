require("mason").setup({
  registries = {
      "github:mason-org/mason-registry",
      "github:Crashdummyy/mason-registry",
  },
  ui = {
    border = "rounded",
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})
