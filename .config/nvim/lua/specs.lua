return {
  'sbdchd/neoformat',
  'skywind3000/asyncrun.vim',
  'kyazdani42/nvim-web-devicons',
  'ahmedkhalf/project.nvim',
  'mfussenegger/nvim-jdtls',
  {
    'mfussenegger/nvim-dap',
    config = function()
        -- Set keymaps to control the debugger
      vim.keymap.set('n', '<F5>', require 'dap'.continue)
      vim.keymap.set('n', '<F10>', require 'dap'.step_over)
      vim.keymap.set('n', '<F11>', require 'dap'.step_into)
      vim.keymap.set('n', '<F12>', require 'dap'.step_out)
      vim.keymap.set('n', '<F2>', require 'dap'.toggle_breakpoint)
    end 
  },
  {
    "microsoft/vscode-js-debug",
    lazy = true,
    build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out" 
  },
  {
    'mxsdev/nvim-dap-vscode-js',
    dependencies = {
      'mfussenegger/nvim-dap'
    },
    config = function()
      require("dap-vscode-js").setup({
        adapters = { 'chrome', 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost', 'node', 'chrome' }, -- which adapters to register in nvim-dap
      })
    end,
  },
  'puremourning/vimspector',
  'vim-latex/vim-latex',
  'maxmellon/vim-jsx-pretty',
  't9md/vim-choosewin',
  'tpope/vim-fugitive',
  'airblade/vim-gitgutter',
  'tpope/vim-surround',
  'tpope/vim-commentary',
  'easymotion/vim-easymotion',
  "junegunn/fzf",
  'junegunn/fzf.vim',
  'maksimr/vim-jsbeautify',
  'itchyny/lightline.vim',
  'sheerun/vim-polyglot',
  'morhetz/gruvbox',
  'dracula/vim',
  'scrooloose/nerdtree',
  'fidian/hexmode',
  'nvim-zh/colorful-winsep.nvim',
  'dariuszlee/vim-dzl-gitdiff',
  {
    "sindrets/diffview.nvim",
    config = function()
      local actions = require("diffview.actions")
      require("diffview").setup({
      keymaps = {
        -- disable_defaults = false, -- Disable the default keymaps
        view = {
        -- The `view` bindings are active in the diff buffers, only when the current
        -- tabpage is a Diffview.
          { "n", "[x", actions.prev_conflict, { desc = "In the merge-tool: jump to the previous conflict" } },
          { "n", "]x", actions.next_conflict, { desc = "In the merge-tool: jump to the next conflict" } },
          { "n", "<leader><leader>do", actions.conflict_choose("ours"), { desc = "Choose the OURS version of a conflict" } },
          { "n", "<leader><leader>dt", actions.conflict_choose("theirs"), { desc = "Choose the THEIRS version of a conflict" } },
          { "n", "<leader><leader>db", actions.conflict_choose("base"), { desc = "Choose the BASE version of a conflict" } },
          { "n", "dx", actions.conflict_choose("none"), { desc = "Delete the conflict region" } },
        },
      }
    })
    end
  },

  {"lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end
  },

  {
      'nvim-treesitter/nvim-treesitter',
      build = ":TSUpdate",
      config = function () 
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            auto_install = true,
            sync_install = true,
            highlight = { enable = true },
            indent = { enable = true },  
          })
      end

  },

  -- ChatGPT
  "nvim-lua/plenary.nvim",
  "MunifTanjim/nui.nvim",
  "nvim-telescope/telescope.nvim",
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {'SirVer/ultisnips'},
  {'honza/vim-snippets'},
  {'quangnguyen30192/cmp-nvim-ultisnips'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/cmp-buffer'},
  {'hrsh7th/cmp-path'},
  {'hrsh7th/cmp-cmdline'},
  {'hrsh7th/nvim-cmp',
    config = function() 
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` rs.
          end,
        },
        window = {
          -- completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'ultisnips' }, -- For ultisnips rs.
            { name = 'path' },
            { name = "codeium" },
          }, 
          {
            { name = 'buffer' },
        })
      })

      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'git' },
        }, {
          { name = 'buffer' },
        })
      })

      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })
    end
  },

  {
    "Exafunction/codeium.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        require("codeium").setup({
        })
    end
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
  { "nanotee/sqls.nvim" },
  {'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      lspconfig.pyright.setup{
        capabilities = capabilities,
        settings = {
          python = {
            analysis = {
              ignore = { '*' },
            },
          },
          pyright = {
            disableOrganizeImports = true,
          }
        }
      }
      lspconfig.ruff.setup {
        init_options = {
          settings = {
            -- Any extra CLI arguments for `ruff` go here.
            args = {},
          }
        }
      }
      lspconfig.lua_ls.setup{
        capabilities = capabilities
      }
      lspconfig.jdtls.setup{}
      lspconfig.sqls.setup{
        on_attach = function(client, bufnr)
            require('sqls').on_attach(client, bufnr)
        end
      }
      lspconfig.terraformls.setup{
        filetypes = { "tf" }
      }
      vim.api.nvim_create_autocmd({"BufWritePre"}, {
        pattern = {"*.tf", "*.tfvars"},
        callback = function()
          vim.lsp.buf.format()
        end,
      })

      -- lspconfig.qml_lsp.setup{
      --   filetypes = { "qml", "qmljs" }
      -- }
      lspconfig.qmlls.setup{
        cmd = { "qmlls6" },
        filetypes = { "qml", "qmljs" }
      }

      lspconfig.clangd.setup{
      }

      vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
      vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
          vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)
          vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
          vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
          end, opts)
        end,
      })
    end
  },
  {
    'akinsho/toggleterm.nvim', 
    version = "*", 
    opts = {--[[ things you want to change go here]]},
    config = function ()
      require("toggleterm").setup{
        open_mapping = [[<C-M-Space>]],
        direction = 'float'
      }

      vim.api.nvim_create_autocmd({ "TermEnter" }, {
        pattern = "term://*toggleterm#*",
        callback = function()
          vim.keymap.set({'t', 'n'}, '<C-M-Space>', '<Cmd>exe v:count1 . "ToggleTerm"<CR>', { silent = true})
        end,
      })
      vim.keymap.set('n', '<C-M-Space>', '<Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>', { silent = true})
      vim.keymap.set('i', '<C-M-Space>', '<Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>', { silent = true})
    end,
  },
  { 'jmbuhr/otter.nvim' }, 
  { "ariel-frischer/bmessages.nvim", events = "CmdlineEnter", opts = {} },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    opts = {
      provider = "claude",
      claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-3-5-sonnet-20241022",
        temperature = 0,
        max_tokens = 8092,
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    config = function()
      require('neo-tree').setup({
        filesystem = {
          commands = {
            avante_add_files = function(state)
              local node = state.tree:get_node()
              local filepath = node:get_id()
              local relative_path = require('avante.utils').relative_path(filepath)

              local sidebar = require('avante').get()

              local open = sidebar:is_open()
              -- ensure avante sidebar is open
              if not open then
                require('avante.api').ask()
                sidebar = require('avante').get()
              end

              sidebar.file_selector:add_selected_file(relative_path)

              -- remove neo tree buffer
              if not open then
                sidebar.file_selector:remove_selected_file('neo-tree filesystem [1]')
              end
            end,
          },
          window = {
            mappings = {
              ['oa'] = 'avante_add_files',
            },
          },
        },
      })
    end,
  },
}
