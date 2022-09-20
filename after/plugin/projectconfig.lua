

pcall(function ()

  local ok, projectconfig= pcall(require, "projectconfig")
  if not ok then
    return
  end


  projectconfig.setup()
  
end)
