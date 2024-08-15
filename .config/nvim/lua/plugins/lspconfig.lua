local get_root_dir = function(fname)
  local util = require("lspconfig.util")
  return util.root_pattern(".git")(fname) or util.root_pattern("package.json", "tsconfig.json")(fname)
end

local Util = require("lazyvim.util")

return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
    diagnostics = {
      virtual_text = false,
    },
    servers = {
      eslint = {
        root_dir = get_root_dir,
      },
      tsserver = {
        root_dir = get_root_dir,
      },
    },
  },
}
