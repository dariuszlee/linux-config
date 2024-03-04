return {
   'skywind3000/asyncrun.vim',
   'kyazdani42/nvim-web-devicons',
   'ahmedkhalf/project.nvim',
   'mfussenegger/nvim-jdtls',
   'mfussenegger/nvim-dap',
   'puremourning/vimspector',
   'vim-latex/vim-latex',
   'maxmellon/vim-jsx-pretty',
   't9md/vim-choosewin',
   'tpope/vim-fugitive',
   'airblade/vim-gitgutter',
   'tpope/vim-surround',
   'tpope/vim-commentary',
   'easymotion/vim-easymotion',
   'junegunn/fzf.vim',
   'junegunn/fzf',
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
    "jackMort/ChatGPT.nvim",
    config = function()

      require("chatgpt").setup({
          api_key_cmd = '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',
          yank_register = "2",
          openai_params = {
            max_tokens = 3000,
          },
          popup_input = {
            prompt = "|",
            border = {
              highlight = "FloatBorder",
              style = "rounded",
              text = {
                top_align = "center",
                top = " Prompt ",
              },
            },
            win_options = {
              winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
            },
            submit = "<C-CR>",
            submit_n = "<Enter>",
          },
        })
      vim.keymap.set('n', '<leader>g', '<cmd>ChatGPT<CR>')
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },

  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    'stevearc/oil.nvim',
    config = function() require("oil").setup({
          -- Id is automatically added at the beginning, and name at the end
          -- See :help oil-columns
          columns = {
            "icon",
            -- "permissions",
            -- "size",
            -- "mtime",
          },
          -- Buffer-local options to  for oil buffers
          buf_options = {
            buflisted = false,
            bufhidden = "hide",
          },
          -- Window-local options to  for oil buffers
          win_options = {
            wrap = false,
            signcolumn = "no",
            cursorcolumn = false,
            foldcolumn = "0",
            spell = false,
            list = false,
            conceallevel = 3,
            concealcursor = "n",
          },
          -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`
          default_file_explorer = true,
          -- Restore window options to previous values when leaving an oil buffer
          restore_win_options = true,
          -- Skip the confirmation popup for simple operations
          skip_confirm_for_simple_edits = false,
          -- Deleted files will be removed with the trash_command (below).
          delete_to_trash = false,
          -- Change this to customize the command d when deleting to trash
          trash_command = "trash-put",
          -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
          prompt_save_on_select_new_entry = true,
          -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
          -- options with a `callback` (e.g. { callback = function() ... end, desc = "", nowait = true })
          -- Additionally, if it is a string that matches "actions.<name>",
          -- it will  the mapping at require("oil.actions").<name>
          -- Set to `false` to remove a keymap
          -- See :help oil-actions for a list of all available actions
          keymaps = {
            ["g?"] = "actions.show_help",
            ["<CR>"] = "actions.select",
            ["<C-s>"] = "actions.select_vsplit",
            ["<C-h>"] = "actions.select_split",
            ["<C-t>"] = "actions.select_tab",
            ["<C-p>"] = "actions.preview",
            ["<C-c>"] = "actions.close",
            ["<C-l>"] = "actions.refresh",
            ["-"] = "actions.parent",
            ["_"] = "actions.open_cwd",
            ["`"] = "actions.cd",
            ["~"] = "actions.tcd",
            ["g."] = "actions.toggle_hidden",
          },
          -- Set to false to disable all of the above keymaps
          _default_keymaps = true,
          view_options = {
            -- Show files and directories that start with "."
            show_hidden = false,
            -- This function defines what is considered a "hidden" file
            is_hidden_file = function(name, bufnr)
              return vim.startswith(name, ".")
            end,
            -- This function defines what will never be shown, even when `show_hidden` is set
            is_always_hidden = function(name, bufnr)
              return false
            end,
          },
          -- Configuration for the floating window in oil.open_float
          float = {
            -- Padding around the floating window
            padding = 2,
            max_width = 0,
            max_height = 0,
            border = "rounded",
            win_options = {
              winblend = 10,
            },
            -- This is the config that will be passed to nvim_open_win.
            -- Change values here to customize the layout
            override = function(conf)
              return conf
            end,
          },
          -- Configuration for the actions floating preview window
          preview = {
            -- Width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
            -- min_width and max_width can be a single value or a list of mixed integer/float types.
            -- max_width = {100, 0.8} means "the lesser of 100 columns or 80% of total"
            max_width = 0.9,
            -- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
            min_width = { 40, 0.4 },
            -- optionally define an integer/float for the exact width of the preview window
            width = nil,
            -- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
            -- min_height and max_height can be a single value or a list of mixed integer/float types.
            -- max_height = {80, 0.9} means "the lesser of 80 columns or 90% of total"
            max_height = 0.9,
            -- min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
            min_height = { 5, 0.1 },
            -- optionally define an integer/float for the exact height of the preview window
            height = nil,
            border = "rounded",
            win_options = {
              winblend = 0,
            },
          },
          -- Configuration for the floating progress window
          progress = {
            max_width = 0.9,
            min_width = { 40, 0.4 },
            width = nil,
            max_height = { 10, 0.9 },
            min_height = { 5, 0.1 },
            height = nil,
            border = "rounded",
            minimized_border = "none",
            win_options = {
              winblend = 0,
            },
          },
      })
    end
  },
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

  {'SirVer/ultisnips'},
  {'honza/vim-snippets'},
  {'quangnguyen30192/cmp-nvim-ultisnips'},
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

  {'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      lspconfig.pyright.setup{
        capabilities = capabilities,
        exclude = { "processed_stock_lmv3", "data" },
        settings = {
          python = {
            exclude = { "processed_stock_lmv3", "data" }
          },
          pyright = {
            exclude = { "processed_stock_lmv3", "data" }
          }
        }
      }
      lspconfig.lua_ls.setup{
        capabilities = capabilities
      }

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

  {'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async',
    config = function ()
      vim.o.foldcolumn = '1'
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
      vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
      vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingRange = {
          dynamicRegistration = false,
          lineFoldingOnly = true
      }
      local language_servers = require("lspconfig").util.available_servers()
      for _, ls in ipairs(language_servers) do
          require('lspconfig')[ls].setup({
              capabilities = capabilities
          })
      end
      require("ufo").setup()
    end
  },

  {
    'rmagatti/auto-session',
    config = function()
    require("auto-session").setup {
      log_level = "error",
    }
    end
  },
  
  {
    'rmagatti/session-lens',
    dependencies = {'rmagatti/auto-session', 'nvim-telescope/telescope.nvim'},
    config = function()
      require('session-lens').setup({--[[your custom config--]]})
    end
  },
}
