pcall(function ()

  local ok, which_key= pcall(require, "which-key")
  if not ok then
    return
  end

  --[[ which_key.register({
  f = {
    name = "file", -- optional group name
    f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
    b = { "<cmd>Telescope buffers<cr>", "Find File" }, -- create a binding with label
    b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
  },
}, { prefix = "<leader>" }) ]]
  which_key.setup()

end)
