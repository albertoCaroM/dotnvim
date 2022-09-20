pcall(require, "impatient")

if require "bruto.first_load"() then
	return
end

require "bruto.disable_builtin"
require 'bruto.plugins'
require "bruto.settings"
require "bruto.dap"
require 'bruto.utils.remaps'
require 'bruto.utils.events'


