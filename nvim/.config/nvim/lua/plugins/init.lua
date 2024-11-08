return {
  {
    "stevearc/conform.nvim",
    config = function()
      require "configs.conform"
    end,
  },
  {
    require "plugins.vimtex"
  },
    {
    require "plugins.luasnip"
  },
  {
    "williamboman/mason.nvim",
    opts={
      ensure_installed = {
      "typescript-language-server"
      }
    }
  },
  {
    'neovim/nvim-lspconfig',  
  },
      {"nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "javascript",
        "typescript",
        "tsx",
        "json",
        -- Add any other languages you commonly use
      },
    },
  }
} 
