-- lua/plugins/tools.lua
return {
  -- telescope: fuzzy find files, symbols, etc
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("telescope").setup({})
    end,
  },

  -- formatter bridge (null-ls successor)
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        cpp = { "clang-format" },
        c = { "clang-format" },
      },
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 500,
      },
    },
    config = function(_, opts)
      require("conform").setup(opts)
    end,
  },

  -- comment toggling with gc
  {
    "numToStr/Comment.nvim",
    opts = {},
    config = function(_, opts)
      require("Comment").setup(opts)
    end,
  },

  -- show keybind hints (leader menu)
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup()
    end,
  },
}

