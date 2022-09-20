pcall(function ()

local ok, hydra = pcall(require, "hydra")
if not ok then
	return
end

local ok, keymap_util = pcall(require, "hydra.keymap-util")
if not ok then
	return
end




local cmd = keymap_util.cmd

-- Windows management, move and resize
--[[ hydra({
	name = "windows",
	mode = "n",
        body = '<Leader>w',
	heads = {
		{ "l", "<C-w>l" },
		{ "h", "<C-w>h" },
		{ "j", "<C-w>j" },
		{ "k", "<C-w>k" },
		{ "q", "<C-w>q" },
		{ "o", "<C-w>o" },
		{ "L", "<C-w>2>" },
		{ "H", "<C-w>2<" },
		{ "J", "<C-w>2-" },
		{ "K", "<C-w>2+" },
		{ "<C-l>", "<C-w>L" },
		{ "<C-h>", "<C-w>H" },
		{ "<C-j>", "<C-w>J" },
		{ "<C-k>", "<C-w>K" },
		{ "=", "<C-w>=" },
	},
})
]]
local splits = require('smart-splits')
local cmd = require('hydra.keymap-util').cmd
local pcmd = require('hydra.keymap-util').pcmd

local buffer_hydra = hydra({
   name = 'Barbar',
   config = {
      on_key = function()
         -- Preserve animation
         vim.wait(200, function() vim.cmd 'redraw' end, 30, false)
      end
   },
   heads = {
      { 'h', function() vim.cmd('BufferPrevious') end, { on_key = false } },
      { 'l', function() vim.cmd('BufferNext') end, { desc = 'choose', on_key = false } },

      { 'H', function() vim.cmd('BufferMovePrevious') end },
      { 'L', function() vim.cmd('BufferMoveNext') end, { desc = 'move' } },

      { 'p', function() vim.cmd('BufferPin') end, { desc = 'pin' } },

      { 'd', function() vim.cmd('BufferClose') end, { desc = 'close' } },
      { 'c', function() vim.cmd('BufferClose') end, { desc = false } },
      { 'q', function() vim.cmd('BufferClose') end, { desc = false } },

      { 'od', function() vim.cmd('BufferOrderByDirectory') end, { desc = 'by directory' } },
      { 'ol', function() vim.cmd('BufferOrderByLanguage') end,  { desc = 'by language' } },
      { '<Esc>', nil, { exit = true } }
   }
})

local function choose_buffer()
   if #vim.fn.getbufinfo({ buflisted = true }) > 1 then
      buffer_hydra:activate()
   end
end

vim.keymap.set('n', 'gb', choose_buffer)

local window_hint = [[
 ^^^^^^^^^^^^     Move      ^^    Size   ^^   ^^     Split
 ^^^^^^^^^^^^-------------  ^^-----------^^   ^^---------------
 ^ ^ _k_ ^ ^  ^ ^ _K_ ^ ^   ^   _<C-k>_   ^   _s_: horizontally 
 _h_ ^ ^ _l_  _H_ ^ ^ _L_   _<C-h>_ _<C-l>_   _v_: vertically
 ^ ^ _j_ ^ ^  ^ ^ _J_ ^ ^   ^   _<C-j>_   ^   _q_, _c_: close
 focus^^^^^^  window^^^^^^  ^_=_: equalize^   _z_: maximize
 ^ ^ ^ ^ ^ ^  ^ ^ ^ ^ ^ ^   ^^ ^          ^   _o_: remain only
 _b_: choose buffer
]]

local window_hydra = hydra({
   name = 'Windows',
   hint = window_hint,
--[[
   config = {
      -- color = 'teal',
       invoke_on_body = true,
      hint = {
         position = 'middle',
         border = 'rounded',
      },
   },  ]]
   config = {
      invoke_on_body = true,
      hint = {
         border = 'rounded',
         offset = -1
      }
   },
   mode = 'n',
   body = '<C-w>',
   heads = {
      { 'h', '<C-w>h' },
      { 'j', '<C-w>j' },
      { 'k', pcmd('wincmd k', 'E11', 'close') },
      { 'l', '<C-w>l' },

      { 'H', cmd 'WinShift left' },
      { 'J', cmd 'WinShift down' },
      { 'K', cmd 'WinShift up' },
      { 'L', cmd 'WinShift right' },

      { '<C-h>', function() splits.resize_left(2)  end },
      { '<C-j>', function() splits.resize_down(2)  end },
      { '<C-k>', function() splits.resize_up(2)    end },
      { '<C-l>', function() splits.resize_right(2) end },
      { '=', '<C-w>=', { desc = 'equalize'} },

      { 's',     pcmd('split', 'E36') },
      { '<C-s>', pcmd('split', 'E36'), { desc = false } },
      { 'v',     pcmd('vsplit', 'E36') },
      { '<C-v>', pcmd('vsplit', 'E36'), { desc = false } },

      { 'w',     '<C-w>w', { exit = true, desc = false } },
      { '<C-w>', '<C-w>w', { exit = true, desc = false } },

      { 'z',     cmd 'MaximizerToggle!', { desc = 'maximize' } },
      { '<C-z>', cmd 'MaximizerToggle!', { exit = true, desc = false } },

      { 'o',     '<C-w>o', { exit = true, desc = 'remain only' } },
      { '<C-o>', '<C-w>o', { exit = true, desc = false } },

      { 'b', choose_buffer, { exit = true, desc = 'choose buffer' } },

      { 'c',     pcmd('close', 'E444') },
      { 'q',     pcmd('close', 'E444'), { desc = 'close window' } },
      { '<C-c>', pcmd('close', 'E444'), { desc = false } },
      { '<C-q>', pcmd('close', 'E444'), { desc = false } },

      { '<Esc>', nil,  { exit = true, desc = false }}
   }
})


   vim.keymap.set('n', '<leader>w', function() window_hydra:activate()end , {desc = 'window hydra'})
   vim.keymap.set('n', '<C-w>', function() window_hydra:activate()end , {desc = 'window hydra'})

local hint = [[
                 _f_: files       _m_: marks
                 _b_: buffers
   🭇🬭🬭🬭🬭🬭🬭🬭🬭🬼    _o_: old files   _g_: live grep
  🭉🭁🭠🭘    🭣🭕🭌🬾   _p_: projects    _/_: search in file
  🭅█ ▁     █🭐
  ██🬿      🭊██   _r_: resume      _u_: undotree
 🭋█🬝🮄🮄🮄🮄🮄🮄🮄🮄🬆█🭀  _h_: vim help    _c_: execute command
 🭤🭒🬺🬹🬱🬭🬭🬭🬭🬵🬹🬹🭝🭙  _k_: keymaps     _;_: commands history 
                 _O_: options     _?_: search history
 ^
                 _<Enter>_: Telescope           _<Esc>_
]]

   local telescope_hydra = hydra({
      name = 'Telescope',
      hint = hint,
      config = {
	 -- color = 'teal',
	 invoke_on_body = true,
	 hint = {
	    position = 'middle',
	    border = 'rounded',
	 },
      }, 

      mode = 'n',
      body = '<Leader>f',
      heads = {
	 { 'f', cmd 'Telescope find_files' },
	 { 'b', cmd 'Telescope buffers', {desc = 'search buffers' }},
	 { 'g', cmd 'Telescope live_grep' },
	 { 'o', cmd 'Telescope oldfiles', { desc = 'recently opened files' } },
	 { 'h', cmd 'Telescope help_tags', { desc = 'vim help' } },
	 { 'm', cmd 'MarksListBuf', { desc = 'marks' } },
	 { 'k', cmd 'Telescope keymaps' },
	 { 'O', cmd 'Telescope vim_options' },
	 { 'r', cmd 'Telescope resume' },
	 { 'p', cmd 'Telescope projects', { desc = 'projects' } },
	 { '/', cmd 'Telescope current_buffer_fuzzy_find', { desc = 'search in file' } },
	 { '?', cmd 'Telescope search_history',  { desc = 'search history' } },
	 { ';', cmd 'Telescope command_history', { desc = 'command-line history' } },
	 { 'c', cmd 'Telescope commands', { desc = 'execute command' } },
	 { 'u', cmd 'silent! %foldopen! | UndotreeToggle', { desc = 'undotree' }},
	 { '<Enter>', cmd 'Telescope', { exit = true, desc = 'list all pickers' } },
	 { '<Esc>', nil, { exit = true, nowait = true } },
      }
   })


   vim.keymap.set('n', '<leader>f', function() telescope_hydra:activate()end , {desc = 'telescope hydra'})
   vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', {desc = 'find files'}) 
   vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', {desc = 'find files'}) 




local hint = [[
 Arrow^^^^^^   Select region with <C-v> 
 ^ ^ _K_ ^ ^   _f_: surround it with box
 _H_ ^ ^ _L_
 ^ ^ _J_ ^ ^                      _<Esc>_
]]

hydra({
   name = 'Draw Diagram',
   hint = hint,
   config = {
      -- color = 'pink',
      invoke_on_body = true,
      hint = {
         border = 'rounded'
      },
      on_enter = function()
         vim.o.virtualedit = 'all'
      end,
   },
   mode = 'n',
   body = '<leader>d',
   heads = {
      { 'H', '<C-v>h:VBox<CR>' },
      { 'J', '<C-v>j:VBox<CR>' },
      { 'K', '<C-v>k:VBox<CR>' },
      { 'L', '<C-v>l:VBox<CR>' },
      { 'f', ':VBox<CR>', { mode = 'v' }},
      { '<Esc>', nil, { exit = true } },
   }
})




       















-- want a way to run make commands
-- Make commands runs good but the output is not good
-- like up I like that is done and good
-- hydra({
-- 	name = "make",
-- 	mode = "n",
-- 	body = "<C-m>",
--     config = {
--         color = "blue",
--     },
-- 	heads = {
-- 		{ "t", function() vim.cmd("vsplit term://make test") end },
--         { "v", function()
--             vim.cmd('vert new')
--             vim.fn.termopen("make vars")
--             vim.cmd('startinsert')
--         end, {exit = true} },
-- 	},
-- })
end)
