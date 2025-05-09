-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    "mason-org/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUpdate" },
    opts = function()
      return require "config.mason"
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = true,
      },
    },
    config = function()
      require "config.lsp"
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
    config = function()
      require("ibl").setup()
    end
  },
  {
    'nvim-tree/nvim-tree.lua',
    cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      vim.api.nvim_create_autocmd("BufEnter", {
        nested = true,
        callback = function()
          if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
            vim.cmd "quit"
          end
        end
      })

      require('nvim-tree').setup {
        view = {
          side = 'right',
        },
      }
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { 'nvim-telescope/telescope-ui-select.nvim' },
      "nvim-treesitter/nvim-treesitter",
    },
    cmd = "Telescope",
    opts = function()
      return require "config.telescope"
    end,
  },
  {
    'saecki/crates.nvim',
    ft = { 'toml' },
    config = function()
      require('crates').setup {
        completion = {
          cmp = {
            enabled = true,
          },
        },
      }
      require('cmp').setup.buffer {
        sources = { { name = 'crates' } },
      }
    end,
  },
  {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          -- Conform will run multiple formatters sequentially
          python = { "isort", "black" },
          -- You can customize some of the format options for the filetype (:help conform.format)
          rust = { "rustfmt", lsp_format = "fallback" },
        },
      })
    end
  },
  {
    'hrsh7th/nvim-cmp',
    config = function()
      require "config.cmp"
    end
  },
  {
    'hrsh7th/cmp-vsnip',
  },
  {
    'hrsh7th/vim-vsnip'
  },
  {
    'hrsh7th/cmp-path',
  },
  {
    'hrsh7th/cmp-nvim-lsp-signature-help',
  },
  {
    'hrsh7th/cmp-nvim-lsp',
    lazy = false,
    config = function() 
      require("cmp").setup.buffer {
       sources = { name = 'nvim_lsp' }
      }
    end
  },
  {
    'chentoast/marks.nvim',
    event = 'VeryLazy',
    opts = {},
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('treesitter-context').setup {
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        multiwindow = false, -- Enable multiwindow support.
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        line_numbers = true,
        multiline_threshold = 20, -- Maximum number of lines to show for a single context
        trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        mode = 'cursor', -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        separator = '-',
        zindex = 20, -- The Z-index of the context window
        on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
      }
    end,
  },
  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    'chrisgrieser/nvim-lsp-endhints',
    event = 'LspAttach',
  },
  {
    'tpope/vim-repeat',
  },
  {
    'ggandor/leap.nvim',
    lazy = false,
    opts = {
      case_sensitive = true,
    },
  },
  {
    'lowitea/aw-watcher.nvim',
    opts = {
      host = '127.0.0.1',
      port = 5600,
    },
  },
  {
    'anuvyklack/hydra.nvim',
    lazy = false,
  },
  {
    'LintaoAmons/cd-project.nvim',
    lazy = false,
    config = function() 
      require("cd-project").setup({
        projects_picker = "telescope",
        hooks = {
          {
            callback = function(_)
              vim.cmd("Telescope find_files")
            end,
          }
        }
      })
    end
  },
  {
    'EdenEast/nightfox.nvim',
  },
  {
    "voldikss/vim-floaterm",
    config = function ()
      require "config.floaterm"
    end
  },
  {
    "windwp/nvim-autopairs",
    opts = {
      fast_wrap = {},
      disable_filetype = { "TelescopePrompt", "vim" },
    },
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)

      -- setup cmp for autopairs
      local cmp_autopairs = require "nvim-autopairs.completion.cmp"
      require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },

}
