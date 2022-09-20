pcall(function()
	vim.opt.list = true vim.opt.listchars:append "space:⋅"
	vim.opt.listchars:append "eol:↴"
	vim.opt.termguicolors = true
	-- vim.gindent_blankline_use_treesitter = true,
	vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
	vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
	vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
	vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
	vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
	vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
	-- vim.cmd [[ highlight IndentBlanklineContextChar guifg=#E06C75 gui=nocombine]]
	-- vim.cmd [[highlight IndentBlanklineContextStart guisp=#E06C75 gui=underline]]
	vim.cmd [[ highlight IndentBlanklineContextChar guifg=#a5802B gui=nocombine]]
	vim.cmd [[highlight IndentBlanklineContextStart guisp=#a5802B gui=underline]]

	local ok,indent_blankline=pcall(require,"indent_blankline")
	if not ok then
		return
	end
	indent_blankline.setup {
		space_char_blankline = " ",
		show_current_context = true,
		show_current_context_start = true,
		filetype_exclude= { "startify","lspinfo", "packer", "checkhealth" ,"help" , "man", ""  },
		buftype_exclude = { "terminal", "nofile", "quickfix", "prompt" ,"startify"},
		char_highlight_list = { "IndentBlanklineIndent5", },
	}
end)
