vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.o.autoread = true

vim.api.nvim_create_autocmd("BufWritePost", {
	callback = function()
		if vim.bo.ft == "python" then
			vim.lsp.buf.code_action {
				context = { only = { "source.organizeImports.ruff" } },
				apply = true,
			}
			vim.lsp.buf.code_action {
				context = { only = { "source.fixAll.ruff" } },
				apply = true,
			}
			os.execute("ruff format " .. vim.fn.expand('%'))
			vim.cmd("e")
		end
	end,
})

vim.keymap.set('n', '<leader><leader>z', vim.lsp.buf.code_action, {buffer =true})

-- Keymaps for ChatGPT
return require('lazy').setup("specs")
