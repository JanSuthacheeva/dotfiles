vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Search for reference
vim.keymap.set("n", "grr", function()
		require("fzf-lua").lsp_references({
			jump_to_single_result = true,
			ignore_current_line = true,
			ignoreDecleration = true,
		})
	end, {})

vim.keymap.set('n', '<Leader>n', ':NvimTreeFindFileToggle<CR>')
-- When text is wrapped, move by terminal rows, not lines, unless a count is provided.
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

vim.keymap.set('n', '<Leader>x', ':BufDel<CR>')
-- Reselect visual selection after indenting.
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Copilot keymaps
vim.keymap.set('i', '<Leader>cp', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})
vim.g.copilot_no_tab_map = true

-- Maintain the cursor position when yanking a visual selection.
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
vim.keymap.set('v', 'y', 'myy`y')

-- Disable annoying command line typo.
vim.keymap.set('n', 'q:', ':q')

-- Paste replace visual selection without copying it.
vim.keymap.set('v', 'p', '"_dP')

-- Easy insertion of a trailing ; or , from insert mode.
vim.keymap.set('i', ';;', '<Esc>A;')
vim.keymap.set('i', ',,', '<Esc>A;')

-- Quickly clear search highlighting.
vim.keymap.set('n', '<Leader>k', ':nohlsearch<CR>')

-- Move lines up and down.
vim.keymap.set('i', '<A-k>', '<Esc>:move *-2<CR>==gi')
vim.keymap.set('i', '<A-j>', '<Esc>:move .+1<CR>==gi')
vim.keymap.set('n', '<A-k>', ':move .+1<CR>==')
vim.keymap.set('n', '<A-j>', ':move *-2<CR>==')

-- Debugging
vim.keymap.set('n', '<Leader>5', function() require('dap').continue() end)
vim.keymap.set('n', '<Leader>0', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>bp', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>Bp', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set({'n', 'v'}, '<Leader>qh', function()
  require('dap.ui.widgets').hover()
end)
vim.keymap.set({'n', 'v'}, '<Leader>qp', function()
  require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>qf', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>qs', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)

vim.keymap.set('n', '<Leader>cc', ':CodeCompanionChat toggle<CR>')
