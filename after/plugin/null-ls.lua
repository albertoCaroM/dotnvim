pcall(function ()

local ok, null_ls = pcall(require, "null-ls")
if not ok then
		return
end

-- local php_actions = require("php-code-actions")

local sources = {
	null_ls.builtins.code_actions.gitsigns,
	null_ls.builtins.formatting.stylua,
	null_ls.builtins.diagnostics.eslint,
	null_ls.builtins.code_actions.proselint,
	null_ls.builtins.code_actions.refactoring,
	null_ls.builtins.code_actions.gitrebase,
	null_ls.builtins.code_actions.shellcheck,
	-- null_ls.builtins.code_actions.luasnip,
	-- null_ls.builtins.code_actions.shell,
	null_ls.builtins.diagnostics.alex,
	null_ls.builtins.diagnostics.buf,
	null_ls.builtins.diagnostics.checkmake,
	null_ls.builtins.diagnostics.codespell ,
	null_ls.builtins.diagnostics.flake8,
	null_ls.builtins.diagnostics.mypy,
	-- null_ls.builtins.diagnostics.phpstan,
	-- null_ls.builtins.formatting.phpcsfixer,
	-- null_ls.builtins.formatting.pint,
	null_ls.builtins.diagnostics.golangci_lint,
	-- null_ls.builtins.formatting.goimports,
	null_ls.builtins.formatting.jq,
    null_ls.builtins.formatting.blade_formatter,
    null_ls.builtins.formatting.sql_formatter,
	-- php_actions.getter_setter,
}

null_ls.setup({
	sources = sources,
})
end)
