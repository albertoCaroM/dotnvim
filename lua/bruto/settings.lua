vim.g.VIMPATH=vim.fn.fnamemodify("expand('<sfile>')", ':h')



vim.wo.number=true     --activate line numbers 
vim.bo.shiftwidth = 4
vim.o.smarttab=false
vim.o.timeoutlen=300   --mapping timeout , then show whichkey
vim.o.ttimeoutlen=50   --keycode timeout
vim.o.history=1000     --number of command lines to remember
vim.o.ttyfast=true     --assume fast terminal connection
vim.o.showcmd=true     --Show (partial) command in the last line of the screen
vim.o.showfulltag=true      --When completing a word in insert mode from the tags file, show both the tag name and a tidied-up form of the search pattern (if there is one) as possible matches.
vim.o.showmatch=true   --automatically highlight matching braces/brackets/etc.
vim.o.matchtime=2      --tens of a second to show matching parentheses
vim.o.lazyredraw=true  -- the screen will not be redrawn while executing macros, registers and other commands that have not been typed.  Also, updating the window title is postponed.  To force an update use |:redraw|.
vim.g.mapleader = ","
vim.g.maplocalleader = '<Space>'



vim.o.shelltemp=false  --use temp files for shell commands.  When off use a pipe.  When using a pipe is not possible temp files are used anyway.
vim.o.modeline=true    --If 'modeline' is off or 'modelines' is 0 no lines are checked.
vim.o.modelines=5      --gives the number of lines that is checked for set commands.


-- disable sounds
vim.o.errorbells=false --No ring the bell (beep or screen flash) for error messages
vim.o.visualbell=false --No use visual bell instead of beeping
vim.o.t_vb=""



-- fold
vim.o.foldenable=true    --enable folds by default
vim.o.foldmethod="syntax"  --fold via syntax of files
vim.o.foldlevelstart=99  --open all folds by default

-- Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force user to select one from the menu
vim.o.completeopt = 'menuone,noinsert,noselect'
vim.o.viewoptions='folds,options,cursor,unix,slash'     --unix/windows compatibility
vim.o.autoread=true         --auto reload if file saved externally 
vim.g.nvimFolder= vim.env.HOME .. "/.config/nvim"
if vim.fn.has("win32") then

vim.g.nvimFolder= vim.env.HOME .. "/AppData/Local/nvim"
end

-- undo
vim.g.undoFolder=vim.g.nvimFolder .. "/undo"
vim.fn.mkdir(vim.g.undoFolder, 'p')
vim.g.undodir=vim.g.undoFolder
vim.o.undofile=true

-- backups
vim.g.backupFolder=vim.g.nvimFolder .. "/bckups"
vim.fn.mkdir(vim.g.backupFolder, 'p')
vim.o.backupdir = vim.g.backupFolder

-- swap files
vim.g.swapFolder=vim.g.nvimFolder .. "/swap"
vim.fn.mkdir(vim.g.swapFolder, 'p')
vim.o.directory = vim.g.swapFolder

vim.o.wildmenu=true                       --Enables "enhanced mode" of command-line completion. When user hits <Tab> (or 'wildchar') to invoke completion       
vim.o.wildmode='list:full'                --When more than one match, list all matches and complete first match.
vim.o.wildignorecase=true                 --ignore cases when completing

vim.o.splitbelow=true                     --Horizontal splits will automatically be below
vim.o.splitright=true                     --Vertical splits will automatically be to the right

--whitespace
vim.o.backspace='indent,eol,start'        -- Allow backspacing everything in insert mode
vim.o.autoindent=true                     -- Automatically indent to match adjacent lines
vim.o.expandtab=true                      -- Converts tabs to spaces
vim.o.shiftwidth=2                        -- Change the number of space characters inserted for indentation
vim.o.tabstop=2                           -- Insert 2 spaces for a tab
vim.o.softtabstop=4                       -- Number of spaces per tab in insert mode
vim.o.smarttab=true                       -- Use shiftwidth to enter tabs
vim.o.list=true                           -- Highlight especials whitespaces (see :help listchars)
vim.o.listchars=[[tab:│\ ,trail:•,extends:❯,precedes:❮]]
vim.cmd('filetype on')                      -- Indent on: Enable indentation rules that are file-type specific.
vim.o.shiftround=true                     -- When shifting lines, round the indentation to the nearest multiple of “shiftwidth.”
vim.o.linebreak=true                      -- Wrap long lines at a character in 'breakat' rather than at the last character that fits on the screen
vim.o.showbreak='↪ '                      -- String to put at the start of lines that have been wrapped
vim.o.scrolloff=1                         -- Always show content after scroll
vim.o.scrolljump=5                        -- Minimum number of lines to scroll
vim.o.display='lastline'                  -- When included, as much as possible of the last line in a window will be displayed.  When not included, a last line that doesn't fit is replaced with "@" lines. 

-- searching
vim.o.hlsearch=true                            --highlight  previuos search pattern
vim.o.incsearch=true                           --While typing a search command, show where the pattern
vim.o.ignorecase=true                          --ignore case for searching
vim.o.smartcase=true                           --do case-sensitive if there's a capital letter
vim.o.fileformats="unix,mac"                        --add mac to auto-detection of file format line endings
vim.cmd("syntax enable")                       -- Enables syntax highlighting

vim.o.hidden=true                         -- Required to keep multiple buffers open multiple buffers
vim.o.wrap=false                         -- Display long lines as just one line

vim.o.encoding="utf-8"                    -- The encoding displayed
vim.o.pumheight=10                        -- Makes popup menu smaller
vim.o.fileencoding="utf-8"                -- The encoding written to file
vim.o.ruler=true                          -- Show the cursor position all the time
vim.o.cmdheight=2                         -- More space for displaying messages
--vim.o.iskeyword+=-                      -- treat dash separated words as a word text object"
vim.o.mouse="a"                            -- Enable your mouse
vim.o.t_Co="256"                            -- Support 256 colors
vim.o.conceallevel=0                      -- So that I can see `` in markdown files
vim.o.smartindent=true                    -- Makes indenting smart
vim.o.laststatus=2			  -- Always display the status line:
vim.o.cursorline=true                     -- Enable highlighting of the current line
vim.o.showtabline=2                       -- Always show tabs
vim.o.showmode=false                      -- We don't need to see things like -- INSERT -- anymore
vim.o.updatetime=300                      -- Faster completion
--vim.o.formatoptions-=cro                -- Stop newline continution of comments
vim.o.clipboard="unnamedplus"             -- Copy paste between vim and everything else
vim.o.background=dark                     -- tell vim what the background color looks like




vim.cmd('syntax on')
vim.o.termguicolors = true  -- Enable true-color terminal.
vim.cmd('highlight ColorColumn ctermbg=0 guibg=lightgrey')
vim.cmd('highlight SignColumn guibg=#282828')









-- addEventListener('CursorLineOff', { 'WinLeave *' }, function () vim.cmd("setlocal nocursorline") end)
-- addEventListener('CursorLineOn', { 'WinEnter *' }, function () vim.cmd("setlocal cursorline") end)
-- addEventListener('OnTermOpen', { 'TermOpen *' }, function () vim.cmd("setlocal nonumber norelativenumber") end)
--
--
-- addEventListener('AutoSourceNvimConf', { 'TermOpen *' }, function () vim.cmd("setlocal nonumber norelativenumber") end)
--
-- -- go back to previous position of cursor if any
-- addEventListener('GoBackToPreviousPositionOfCursor', { 'BufReadPost *' }, function ()
-- 	if vim.fn.line([['"]]) > 0 and vim.fn.line([['"]]) <= vim.fn.line("$")  then
--       vim.cmd([[exe 'normal! g`"zvzz']])
--   end
--  end)
--




