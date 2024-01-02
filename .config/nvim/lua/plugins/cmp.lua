return {
  "hrsh7th/nvim-cmp",
  opts = {
    window = {
      completion = require("cmp").config.window.bordered({ border = "solid" }),
      documentation = require("cmp").config.window.bordered({ border = "solid" }),
    },
  },
}
