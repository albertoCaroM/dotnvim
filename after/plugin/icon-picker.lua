pcall( function ()
	local	ok,icon_picker= pcall(require("icon-picker"))
	if not ok then
		return
	end
	icon_picker.setup({
		disable_legacy_commands = true
	})
end)

