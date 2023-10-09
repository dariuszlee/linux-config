-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/dzly/.cache/nvim/packer_hererocks/2.1.1692616192/share/lua/5.1/?.lua;/home/dzly/.cache/nvim/packer_hererocks/2.1.1692616192/share/lua/5.1/?/init.lua;/home/dzly/.cache/nvim/packer_hererocks/2.1.1692616192/lib/luarocks/rocks-5.1/?.lua;/home/dzly/.cache/nvim/packer_hererocks/2.1.1692616192/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/dzly/.cache/nvim/packer_hererocks/2.1.1692616192/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["ChatGPT.nvim"] = {
    config = { "\27LJ\2\n¨\3\0\0\6\0\20\0\0246\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0005\4\a\0005\5\b\0=\5\t\4=\4\n\0035\4\v\0=\4\f\3=\3\r\2B\0\2\0016\0\14\0009\0\15\0009\0\16\0'\2\17\0'\3\18\0'\4\19\0B\0\4\1K\0\1\0\21<cmd>ChatGPT<CR>\14<leader>g\6n\bset\vkeymap\bvim\16popup_input\16win_options\1\0\1\17winhighlight*Normal:Normal,FloatBorder:FloatBorder\vborder\ttext\1\0\2\14top_align\vcenter\btop\r Prompt \1\0\2\nstyle\frounded\14highlight\16FloatBorder\1\0\3\vprompt\6|\vsubmit\v<C-CR>\rsubmit_n\f<Enter>\18openai_params\1\0\1\15max_tokens\3¸\23\1\0\1\18yank_register\0062\nsetup\fchatgpt\frequire\0" },
    loaded = true,
    path = "/home/dzly/.local/share/nvim/site/pack/packer/start/ChatGPT.nvim",
    url = "https://github.com/jackMort/ChatGPT.nvim"
  },
  ["auto-session"] = {
    config = { "\27LJ\2\nQ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\14log_level\nerror\nsetup\17auto-session\frequire\0" },
    loaded = true,
    path = "/home/dzly/.local/share/nvim/site/pack/packer/start/auto-session",
    url = "https://github.com/rmagatti/auto-session"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/dzly/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/dzly/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/dzly/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-ultisnips"] = {
    loaded = true,
    path = "/home/dzly/.local/share/nvim/site/pack/packer/start/cmp-nvim-ultisnips",
    url = "https://github.com/quangnguyen30192/cmp-nvim-ultisnips"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/dzly/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["diffview.nvim"] = {
    config = { "\27LJ\2\nï\5\0\0\n\0\27\0:6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\25\0005\4\23\0004\5\a\0005\6\4\0009\a\5\0>\a\3\0065\a\6\0>\a\4\6>\6\1\0055\6\a\0009\a\b\0>\a\3\0065\a\t\0>\a\4\6>\6\2\0055\6\n\0009\a\v\0'\t\f\0B\a\2\2>\a\3\0065\a\r\0>\a\4\6>\6\3\0055\6\14\0009\a\v\0'\t\15\0B\a\2\2>\a\3\0065\a\16\0>\a\4\6>\6\4\0055\6\17\0009\a\v\0'\t\18\0B\a\2\2>\a\3\0065\a\19\0>\a\4\6>\6\5\0055\6\20\0009\a\v\0'\t\21\0B\a\2\2>\a\3\0065\a\22\0>\a\4\6>\6\6\5=\5\24\4=\4\26\3B\1\2\1K\0\1\0\fkeymaps\1\0\0\tview\1\0\0\1\0\1\tdesc\31Delete the conflict region\tnone\1\3\0\0\6n\adx\1\0\1\tdesc*Choose the BASE version of a conflict\tbase\1\3\0\0\6n\23<leader><leader>db\1\0\1\tdesc,Choose the THEIRS version of a conflict\vtheirs\1\3\0\0\6n\23<leader><leader>dt\1\0\1\tdesc*Choose the OURS version of a conflict\tours\20conflict_choose\1\3\0\0\6n\23<leader><leader>do\1\0\1\tdesc1In the merge-tool: jump to the next conflict\18next_conflict\1\3\0\0\6n\a]x\1\0\1\tdesc5In the merge-tool: jump to the previous conflict\18prev_conflict\1\3\0\0\6n\a[x\nsetup\rdiffview\21diffview.actions\frequire\0" },
    loaded = true,
    path = "/home/dzly/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/dzly/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["lazygit.nvim"] = {
    loaded = true,
    path = "/home/dzly/.local/share/nvim/site/pack/packer/start/lazygit.nvim",
    url = "https://github.com/kdheepak/lazygit.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/dzly/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n:\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\19UltiSnips#Anon\afn\bvim…\6\1\0\n\0*\0i6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0003\5\3\0=\5\5\4=\4\a\0034\4\0\0=\4\b\0039\4\t\0009\4\n\0049\4\v\0045\6\r\0009\a\t\0009\a\f\a)\tüÿB\a\2\2=\a\14\0069\a\t\0009\a\f\a)\t\4\0B\a\2\2=\a\15\0069\a\t\0009\a\16\aB\a\1\2=\a\17\0069\a\t\0009\a\18\aB\a\1\2=\a\19\0069\a\t\0009\a\20\a5\t\21\0B\a\2\2=\a\22\6B\4\2\2=\4\t\0039\4\23\0009\4\24\0044\6\4\0005\a\25\0>\a\1\0065\a\26\0>\a\2\0065\a\27\0>\a\3\0064\a\3\0005\b\28\0>\b\1\aB\4\3\2=\4\24\3B\1\2\0019\1\2\0009\1\29\1'\3\30\0005\4!\0009\5\23\0009\5\24\0054\a\3\0005\b\31\0>\b\1\a4\b\3\0005\t \0>\t\1\bB\5\3\2=\5\24\4B\1\3\0019\1\2\0009\1\"\0015\3#\0005\4$\0009\5\t\0009\5\n\0059\5\"\5B\5\1\2=\5\t\0044\5\3\0005\6%\0>\6\1\5=\5\24\4B\1\3\0019\1\2\0009\1\"\1'\3&\0005\4'\0009\5\t\0009\5\n\0059\5\"\5B\5\1\2=\5\t\0049\5\23\0009\5\24\0054\a\3\0005\b(\0>\b\1\a4\b\3\0005\t)\0>\t\1\bB\5\3\2=\5\24\4B\1\3\1K\0\1\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\1\0\0\6:\1\0\1\tname\vbuffer\1\0\0\1\3\0\0\6/\6?\fcmdline\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\bgit\14gitcommit\rfiletype\1\0\1\tname\vbuffer\1\0\1\tname\tpath\1\0\1\tname\14ultisnips\1\0\1\tname\rnvim_lsp\fsources\vconfig\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\vwindow\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\frequire\0" },
    loaded = true,
    path = "/home/dzly/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nd\0\0\6\0\6\0\v6\0\0\0006\2\1\0009\2\2\0026\4\1\0009\4\3\0049\4\4\0049\4\5\4B\4\1\0A\2\0\0A\0\0\1K\0\1\0\27list_workspace_folders\bbuf\blsp\finspect\bvim\nprint@\0\0\3\0\5\0\a6\0\0\0009\0\1\0009\0\2\0009\0\3\0005\2\4\0B\0\2\1K\0\1\0\1\0\1\nasync\2\vformat\bbuf\blsp\bvim’\a\1\1\b\0&\0“\0016\1\0\0009\1\1\0019\2\2\0008\1\2\1'\2\4\0=\2\3\0015\1\5\0009\2\2\0=\2\6\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\n\0006\6\0\0009\6\v\0069\6\2\0069\6\f\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\r\0006\6\0\0009\6\v\0069\6\2\0069\6\14\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\15\0006\6\0\0009\6\v\0069\6\2\0069\6\16\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\17\0006\6\0\0009\6\v\0069\6\2\0069\6\18\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\19\0006\6\0\0009\6\v\0069\6\2\0069\6\20\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\21\0006\6\0\0009\6\v\0069\6\2\0069\6\22\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\23\0006\6\0\0009\6\v\0069\6\2\0069\6\24\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\25\0003\6\26\0\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\27\0006\6\0\0009\6\v\0069\6\2\0069\6\28\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\29\0006\6\0\0009\6\v\0069\6\2\0069\6\30\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\0025\4\31\0'\5 \0006\6\0\0009\6\v\0069\6\2\0069\6!\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\"\0006\6\0\0009\6\v\0069\6\2\0069\6#\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5$\0003\6%\0\18\a\1\0B\2\5\1K\0\1\0\0\r<space>f\15references\agr\16code_action\14<space>ca\1\3\0\0\6n\6v\vrename\14<space>rn\20type_definition\r<space>D\0\14<space>wl\28remove_workspace_folder\14<space>wr\25add_workspace_folder\14<space>wa\19signature_help\n<C-k>\19implementation\agi\nhover\6K\15definition\agd\16declaration\blsp\agD\6n\bset\vkeymap\vbuffer\1\0\0\27v:lua.vim.lsp.omnifunc\romnifunc\bbuf\abo\bvimÂ\6\1\0\n\0000\0^6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\1B\1\1\0029\2\4\0009\2\5\0025\4\6\0=\1\a\0045\5\b\0=\5\t\0045\5\f\0005\6\v\0005\a\n\0=\a\t\6=\6\r\0055\6\15\0005\a\14\0=\a\t\6=\6\4\5=\5\16\4B\2\2\0019\2\17\0009\2\5\0025\4\18\0=\1\a\4B\2\2\0019\2\19\0009\2\5\0025\4\21\0005\5\20\0=\5\22\0045\5\23\0=\5\24\4B\2\2\0019\2\25\0009\2\5\0024\4\0\0B\2\2\0016\2\26\0009\2\27\0029\2\28\2'\4\29\0'\5\30\0006\6\26\0009\6\31\0069\6 \6B\2\4\0016\2\26\0009\2\27\0029\2\28\2'\4\29\0'\5!\0006\6\26\0009\6\31\0069\6\"\6B\2\4\0016\2\26\0009\2\27\0029\2\28\2'\4\29\0'\5#\0006\6\26\0009\6\31\0069\6$\6B\2\4\0016\2\26\0009\2\27\0029\2\28\2'\4\29\0'\5%\0006\6\26\0009\6\31\0069\6&\6B\2\4\0016\2\26\0009\2'\0029\2(\2'\4)\0005\5,\0006\6\26\0009\6'\0069\6*\6'\b+\0004\t\0\0B\6\3\2=\6-\0053\6.\0=\6/\5B\2\3\1K\0\1\0\rcallback\0\ngroup\1\0\0\18UserLspConfig\24nvim_create_augroup\14LspAttach\24nvim_create_autocmd\bapi\15setloclist\r<space>q\14goto_next\a]d\14goto_prev\a[d\15open_float\15diagnostic\r<space>e\6n\bset\vkeymap\bvim\vclangd\14filetypes\1\3\0\0\bqml\nqmljs\bcmd\1\0\0\1\2\0\0\vqmlls6\nqmlls\1\0\0\vlua_ls\rsettings\1\0\0\1\3\0\0\25processed_stock_lmv3\tdata\vpython\1\0\0\1\0\0\1\3\0\0\25processed_stock_lmv3\tdata\fexclude\1\3\0\0\25processed_stock_lmv3\tdata\17capabilities\1\0\0\nsetup\fpyright\25default_capabilities\17cmp_nvim_lsp\14lspconfig\frequire\0" },
    loaded = true,
    path = "/home/dzly/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/dzly/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ufo"] = {
    config = { "\27LJ\2\n·\4\0\0\n\0\29\0F6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1c\0=\1\4\0006\0\0\0009\0\1\0)\1c\0=\1\5\0006\0\0\0009\0\1\0+\1\2\0=\1\6\0006\0\0\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0006\4\v\0'\6\f\0B\4\2\0029\4\r\4B\0\4\0016\0\0\0009\0\a\0009\0\b\0'\2\t\0'\3\14\0006\4\v\0'\6\f\0B\4\2\0029\4\15\4B\0\4\0016\0\0\0009\0\16\0009\0\17\0009\0\18\0B\0\1\0029\1\19\0005\2\21\0=\2\20\0016\1\v\0'\3\22\0B\1\2\0029\1\23\0019\1\24\1B\1\1\0026\2\25\0\18\4\1\0B\2\2\4X\5\b€6\a\v\0'\t\22\0B\a\2\0028\a\6\a9\a\26\a5\t\27\0=\0\28\tB\a\2\1E\5\3\3R\5ö\1276\2\v\0'\4\f\0B\2\2\0029\2\26\2B\2\1\1K\0\1\0\17capabilities\1\0\0\nsetup\vipairs\22available_servers\tutil\14lspconfig\1\0\2\24dynamicRegistration\1\20lineFoldingOnly\2\17foldingRange\17textDocument\29make_client_capabilities\rprotocol\blsp\18closeAllFolds\azM\17openAllFolds\bufo\frequire\azR\6n\bset\vkeymap\15foldenable\19foldlevelstart\14foldlevel\0061\15foldcolumn\6o\bvim\0" },
    loaded = true,
    path = "/home/dzly/.local/share/nvim/site/pack/packer/start/nvim-ufo",
    url = "https://github.com/kevinhwang91/nvim-ufo"
  },
  ["oil.nvim"] = {
    config = { "\27LJ\2\n,\0\2\6\0\3\0\0056\2\0\0009\2\1\2\18\4\0\0'\5\2\0D\2\3\0\6.\15startswith\bvim\15\0\2\3\0\0\0\2+\2\1\0L\2\2\0\v\0\1\1\0\0\0\1L\0\2\0è\t\1\0\5\0%\0-6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0003\4\r\0=\4\14\0033\4\15\0=\4\16\3=\3\17\0025\3\18\0005\4\19\0=\4\t\0033\4\20\0=\4\21\3=\3\22\0025\3\23\0005\4\24\0=\4\25\0035\4\26\0=\4\27\0035\4\28\0=\4\t\3=\3\29\0025\3\30\0005\4\31\0=\4\25\0035\4 \0=\4!\0035\4\"\0=\4\27\0035\4#\0=\4\t\3=\3$\2B\0\2\1K\0\1\0\rprogress\1\0\1\rwinblend\3\0\1\3\0\0\3\5\4š³æÌ\t™³æý\3\15max_height\1\3\0\0\3\n\4Í™³æ\fÌ™³ÿ\3\1\3\0\0\3(\4š³æÌ\t™³æþ\3\1\0\3\21minimized_border\tnone\vborder\frounded\14max_width\4Í™³æ\fÌ™³ÿ\3\fpreview\1\0\1\rwinblend\3\0\15min_height\1\3\0\0\3\5\4š³æÌ\t™³æý\3\14min_width\1\3\0\0\3(\4š³æÌ\t™³æþ\3\1\0\3\vborder\frounded\15max_height\4Í™³æ\fÌ™³ÿ\3\14max_width\4Í™³æ\fÌ™³ÿ\3\nfloat\roverride\0\1\0\1\rwinblend\3\n\1\0\4\vborder\frounded\fpadding\3\2\15max_height\3\0\14max_width\3\0\17view_options\21is_always_hidden\0\19is_hidden_file\0\1\0\1\16show_hidden\1\fkeymaps\1\0\r\t<CR>\19actions.select\6_\21actions.open_cwd\ag?\22actions.show_help\6`\15actions.cd\n<C-l>\20actions.refresh\6~\16actions.tcd\n<C-c>\18actions.close\n<C-h>\25actions.select_split\n<C-p>\20actions.preview\n<C-s>\26actions.select_vsplit\n<C-t>\23actions.select_tab\ag.\26actions.toggle_hidden\6-\19actions.parent\16win_options\1\0\b\twrap\1\15signcolumn\ano\nspell\1\17conceallevel\3\3\tlist\1\18concealcursor\6n\15foldcolumn\0060\17cursorcolumn\1\16buf_options\1\0\2\14buflisted\1\14bufhidden\thide\fcolumns\1\0\a\24restore_win_options\2\26default_file_explorer\2\24use_default_keymaps\2$prompt_save_on_select_new_entry\2\18trash_command\14trash-put\20delete_to_trash\1\"skip_confirm_for_simple_edits\1\1\2\0\0\ticon\nsetup\boil\frequire\0" },
    loaded = true,
    path = "/home/dzly/.local/share/nvim/site/pack/packer/start/oil.nvim",
    url = "https://github.com/stevearc/oil.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/dzly/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/dzly/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["promise-async"] = {
    loaded = true,
    path = "/home/dzly/.local/share/nvim/site/pack/packer/start/promise-async",
    url = "https://github.com/kevinhwang91/promise-async"
  },
  ["session-lens"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17session-lens\frequire\0" },
    loaded = true,
    path = "/home/dzly/.local/share/nvim/site/pack/packer/start/session-lens",
    url = "https://github.com/rmagatti/session-lens"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/dzly/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: auto-session
time([[Config for auto-session]], true)
try_loadstring("\27LJ\2\nQ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\14log_level\nerror\nsetup\17auto-session\frequire\0", "config", "auto-session")
time([[Config for auto-session]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: ChatGPT.nvim
time([[Config for ChatGPT.nvim]], true)
try_loadstring("\27LJ\2\n¨\3\0\0\6\0\20\0\0246\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0005\4\a\0005\5\b\0=\5\t\4=\4\n\0035\4\v\0=\4\f\3=\3\r\2B\0\2\0016\0\14\0009\0\15\0009\0\16\0'\2\17\0'\3\18\0'\4\19\0B\0\4\1K\0\1\0\21<cmd>ChatGPT<CR>\14<leader>g\6n\bset\vkeymap\bvim\16popup_input\16win_options\1\0\1\17winhighlight*Normal:Normal,FloatBorder:FloatBorder\vborder\ttext\1\0\2\14top_align\vcenter\btop\r Prompt \1\0\2\nstyle\frounded\14highlight\16FloatBorder\1\0\3\vprompt\6|\vsubmit\v<C-CR>\rsubmit_n\f<Enter>\18openai_params\1\0\1\15max_tokens\3¸\23\1\0\1\18yank_register\0062\nsetup\fchatgpt\frequire\0", "config", "ChatGPT.nvim")
time([[Config for ChatGPT.nvim]], false)
-- Config for: session-lens
time([[Config for session-lens]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17session-lens\frequire\0", "config", "session-lens")
time([[Config for session-lens]], false)
-- Config for: oil.nvim
time([[Config for oil.nvim]], true)
try_loadstring("\27LJ\2\n,\0\2\6\0\3\0\0056\2\0\0009\2\1\2\18\4\0\0'\5\2\0D\2\3\0\6.\15startswith\bvim\15\0\2\3\0\0\0\2+\2\1\0L\2\2\0\v\0\1\1\0\0\0\1L\0\2\0è\t\1\0\5\0%\0-6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0003\4\r\0=\4\14\0033\4\15\0=\4\16\3=\3\17\0025\3\18\0005\4\19\0=\4\t\0033\4\20\0=\4\21\3=\3\22\0025\3\23\0005\4\24\0=\4\25\0035\4\26\0=\4\27\0035\4\28\0=\4\t\3=\3\29\0025\3\30\0005\4\31\0=\4\25\0035\4 \0=\4!\0035\4\"\0=\4\27\0035\4#\0=\4\t\3=\3$\2B\0\2\1K\0\1\0\rprogress\1\0\1\rwinblend\3\0\1\3\0\0\3\5\4š³æÌ\t™³æý\3\15max_height\1\3\0\0\3\n\4Í™³æ\fÌ™³ÿ\3\1\3\0\0\3(\4š³æÌ\t™³æþ\3\1\0\3\21minimized_border\tnone\vborder\frounded\14max_width\4Í™³æ\fÌ™³ÿ\3\fpreview\1\0\1\rwinblend\3\0\15min_height\1\3\0\0\3\5\4š³æÌ\t™³æý\3\14min_width\1\3\0\0\3(\4š³æÌ\t™³æþ\3\1\0\3\vborder\frounded\15max_height\4Í™³æ\fÌ™³ÿ\3\14max_width\4Í™³æ\fÌ™³ÿ\3\nfloat\roverride\0\1\0\1\rwinblend\3\n\1\0\4\vborder\frounded\fpadding\3\2\15max_height\3\0\14max_width\3\0\17view_options\21is_always_hidden\0\19is_hidden_file\0\1\0\1\16show_hidden\1\fkeymaps\1\0\r\t<CR>\19actions.select\6_\21actions.open_cwd\ag?\22actions.show_help\6`\15actions.cd\n<C-l>\20actions.refresh\6~\16actions.tcd\n<C-c>\18actions.close\n<C-h>\25actions.select_split\n<C-p>\20actions.preview\n<C-s>\26actions.select_vsplit\n<C-t>\23actions.select_tab\ag.\26actions.toggle_hidden\6-\19actions.parent\16win_options\1\0\b\twrap\1\15signcolumn\ano\nspell\1\17conceallevel\3\3\tlist\1\18concealcursor\6n\15foldcolumn\0060\17cursorcolumn\1\16buf_options\1\0\2\14buflisted\1\14bufhidden\thide\fcolumns\1\0\a\24restore_win_options\2\26default_file_explorer\2\24use_default_keymaps\2$prompt_save_on_select_new_entry\2\18trash_command\14trash-put\20delete_to_trash\1\"skip_confirm_for_simple_edits\1\1\2\0\0\ticon\nsetup\boil\frequire\0", "config", "oil.nvim")
time([[Config for oil.nvim]], false)
-- Config for: diffview.nvim
time([[Config for diffview.nvim]], true)
try_loadstring("\27LJ\2\nï\5\0\0\n\0\27\0:6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\25\0005\4\23\0004\5\a\0005\6\4\0009\a\5\0>\a\3\0065\a\6\0>\a\4\6>\6\1\0055\6\a\0009\a\b\0>\a\3\0065\a\t\0>\a\4\6>\6\2\0055\6\n\0009\a\v\0'\t\f\0B\a\2\2>\a\3\0065\a\r\0>\a\4\6>\6\3\0055\6\14\0009\a\v\0'\t\15\0B\a\2\2>\a\3\0065\a\16\0>\a\4\6>\6\4\0055\6\17\0009\a\v\0'\t\18\0B\a\2\2>\a\3\0065\a\19\0>\a\4\6>\6\5\0055\6\20\0009\a\v\0'\t\21\0B\a\2\2>\a\3\0065\a\22\0>\a\4\6>\6\6\5=\5\24\4=\4\26\3B\1\2\1K\0\1\0\fkeymaps\1\0\0\tview\1\0\0\1\0\1\tdesc\31Delete the conflict region\tnone\1\3\0\0\6n\adx\1\0\1\tdesc*Choose the BASE version of a conflict\tbase\1\3\0\0\6n\23<leader><leader>db\1\0\1\tdesc,Choose the THEIRS version of a conflict\vtheirs\1\3\0\0\6n\23<leader><leader>dt\1\0\1\tdesc*Choose the OURS version of a conflict\tours\20conflict_choose\1\3\0\0\6n\23<leader><leader>do\1\0\1\tdesc1In the merge-tool: jump to the next conflict\18next_conflict\1\3\0\0\6n\a]x\1\0\1\tdesc5In the merge-tool: jump to the previous conflict\18prev_conflict\1\3\0\0\6n\a[x\nsetup\rdiffview\21diffview.actions\frequire\0", "config", "diffview.nvim")
time([[Config for diffview.nvim]], false)
-- Config for: nvim-ufo
time([[Config for nvim-ufo]], true)
try_loadstring("\27LJ\2\n·\4\0\0\n\0\29\0F6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1c\0=\1\4\0006\0\0\0009\0\1\0)\1c\0=\1\5\0006\0\0\0009\0\1\0+\1\2\0=\1\6\0006\0\0\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0006\4\v\0'\6\f\0B\4\2\0029\4\r\4B\0\4\0016\0\0\0009\0\a\0009\0\b\0'\2\t\0'\3\14\0006\4\v\0'\6\f\0B\4\2\0029\4\15\4B\0\4\0016\0\0\0009\0\16\0009\0\17\0009\0\18\0B\0\1\0029\1\19\0005\2\21\0=\2\20\0016\1\v\0'\3\22\0B\1\2\0029\1\23\0019\1\24\1B\1\1\0026\2\25\0\18\4\1\0B\2\2\4X\5\b€6\a\v\0'\t\22\0B\a\2\0028\a\6\a9\a\26\a5\t\27\0=\0\28\tB\a\2\1E\5\3\3R\5ö\1276\2\v\0'\4\f\0B\2\2\0029\2\26\2B\2\1\1K\0\1\0\17capabilities\1\0\0\nsetup\vipairs\22available_servers\tutil\14lspconfig\1\0\2\24dynamicRegistration\1\20lineFoldingOnly\2\17foldingRange\17textDocument\29make_client_capabilities\rprotocol\blsp\18closeAllFolds\azM\17openAllFolds\bufo\frequire\azR\6n\bset\vkeymap\15foldenable\19foldlevelstart\14foldlevel\0061\15foldcolumn\6o\bvim\0", "config", "nvim-ufo")
time([[Config for nvim-ufo]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nd\0\0\6\0\6\0\v6\0\0\0006\2\1\0009\2\2\0026\4\1\0009\4\3\0049\4\4\0049\4\5\4B\4\1\0A\2\0\0A\0\0\1K\0\1\0\27list_workspace_folders\bbuf\blsp\finspect\bvim\nprint@\0\0\3\0\5\0\a6\0\0\0009\0\1\0009\0\2\0009\0\3\0005\2\4\0B\0\2\1K\0\1\0\1\0\1\nasync\2\vformat\bbuf\blsp\bvim’\a\1\1\b\0&\0“\0016\1\0\0009\1\1\0019\2\2\0008\1\2\1'\2\4\0=\2\3\0015\1\5\0009\2\2\0=\2\6\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\n\0006\6\0\0009\6\v\0069\6\2\0069\6\f\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\r\0006\6\0\0009\6\v\0069\6\2\0069\6\14\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\15\0006\6\0\0009\6\v\0069\6\2\0069\6\16\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\17\0006\6\0\0009\6\v\0069\6\2\0069\6\18\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\19\0006\6\0\0009\6\v\0069\6\2\0069\6\20\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\21\0006\6\0\0009\6\v\0069\6\2\0069\6\22\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\23\0006\6\0\0009\6\v\0069\6\2\0069\6\24\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\25\0003\6\26\0\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\27\0006\6\0\0009\6\v\0069\6\2\0069\6\28\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\29\0006\6\0\0009\6\v\0069\6\2\0069\6\30\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\0025\4\31\0'\5 \0006\6\0\0009\6\v\0069\6\2\0069\6!\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\"\0006\6\0\0009\6\v\0069\6\2\0069\6#\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5$\0003\6%\0\18\a\1\0B\2\5\1K\0\1\0\0\r<space>f\15references\agr\16code_action\14<space>ca\1\3\0\0\6n\6v\vrename\14<space>rn\20type_definition\r<space>D\0\14<space>wl\28remove_workspace_folder\14<space>wr\25add_workspace_folder\14<space>wa\19signature_help\n<C-k>\19implementation\agi\nhover\6K\15definition\agd\16declaration\blsp\agD\6n\bset\vkeymap\vbuffer\1\0\0\27v:lua.vim.lsp.omnifunc\romnifunc\bbuf\abo\bvimÂ\6\1\0\n\0000\0^6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\1B\1\1\0029\2\4\0009\2\5\0025\4\6\0=\1\a\0045\5\b\0=\5\t\0045\5\f\0005\6\v\0005\a\n\0=\a\t\6=\6\r\0055\6\15\0005\a\14\0=\a\t\6=\6\4\5=\5\16\4B\2\2\0019\2\17\0009\2\5\0025\4\18\0=\1\a\4B\2\2\0019\2\19\0009\2\5\0025\4\21\0005\5\20\0=\5\22\0045\5\23\0=\5\24\4B\2\2\0019\2\25\0009\2\5\0024\4\0\0B\2\2\0016\2\26\0009\2\27\0029\2\28\2'\4\29\0'\5\30\0006\6\26\0009\6\31\0069\6 \6B\2\4\0016\2\26\0009\2\27\0029\2\28\2'\4\29\0'\5!\0006\6\26\0009\6\31\0069\6\"\6B\2\4\0016\2\26\0009\2\27\0029\2\28\2'\4\29\0'\5#\0006\6\26\0009\6\31\0069\6$\6B\2\4\0016\2\26\0009\2\27\0029\2\28\2'\4\29\0'\5%\0006\6\26\0009\6\31\0069\6&\6B\2\4\0016\2\26\0009\2'\0029\2(\2'\4)\0005\5,\0006\6\26\0009\6'\0069\6*\6'\b+\0004\t\0\0B\6\3\2=\6-\0053\6.\0=\6/\5B\2\3\1K\0\1\0\rcallback\0\ngroup\1\0\0\18UserLspConfig\24nvim_create_augroup\14LspAttach\24nvim_create_autocmd\bapi\15setloclist\r<space>q\14goto_next\a]d\14goto_prev\a[d\15open_float\15diagnostic\r<space>e\6n\bset\vkeymap\bvim\vclangd\14filetypes\1\3\0\0\bqml\nqmljs\bcmd\1\0\0\1\2\0\0\vqmlls6\nqmlls\1\0\0\vlua_ls\rsettings\1\0\0\1\3\0\0\25processed_stock_lmv3\tdata\vpython\1\0\0\1\0\0\1\3\0\0\25processed_stock_lmv3\tdata\fexclude\1\3\0\0\25processed_stock_lmv3\tdata\17capabilities\1\0\0\nsetup\fpyright\25default_capabilities\17cmp_nvim_lsp\14lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n:\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\19UltiSnips#Anon\afn\bvim…\6\1\0\n\0*\0i6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0003\5\3\0=\5\5\4=\4\a\0034\4\0\0=\4\b\0039\4\t\0009\4\n\0049\4\v\0045\6\r\0009\a\t\0009\a\f\a)\tüÿB\a\2\2=\a\14\0069\a\t\0009\a\f\a)\t\4\0B\a\2\2=\a\15\0069\a\t\0009\a\16\aB\a\1\2=\a\17\0069\a\t\0009\a\18\aB\a\1\2=\a\19\0069\a\t\0009\a\20\a5\t\21\0B\a\2\2=\a\22\6B\4\2\2=\4\t\0039\4\23\0009\4\24\0044\6\4\0005\a\25\0>\a\1\0065\a\26\0>\a\2\0065\a\27\0>\a\3\0064\a\3\0005\b\28\0>\b\1\aB\4\3\2=\4\24\3B\1\2\0019\1\2\0009\1\29\1'\3\30\0005\4!\0009\5\23\0009\5\24\0054\a\3\0005\b\31\0>\b\1\a4\b\3\0005\t \0>\t\1\bB\5\3\2=\5\24\4B\1\3\0019\1\2\0009\1\"\0015\3#\0005\4$\0009\5\t\0009\5\n\0059\5\"\5B\5\1\2=\5\t\0044\5\3\0005\6%\0>\6\1\5=\5\24\4B\1\3\0019\1\2\0009\1\"\1'\3&\0005\4'\0009\5\t\0009\5\n\0059\5\"\5B\5\1\2=\5\t\0049\5\23\0009\5\24\0054\a\3\0005\b(\0>\b\1\a4\b\3\0005\t)\0>\t\1\bB\5\3\2=\5\24\4B\1\3\1K\0\1\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\1\0\0\6:\1\0\1\tname\vbuffer\1\0\0\1\3\0\0\6/\6?\fcmdline\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\bgit\14gitcommit\rfiletype\1\0\1\tname\vbuffer\1\0\1\tname\tpath\1\0\1\tname\14ultisnips\1\0\1\tname\rnvim_lsp\fsources\vconfig\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\vwindow\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
