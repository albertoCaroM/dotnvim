function download_packer(options)
  options = options or {force=false}
  if options.force == false then
    if vim.fn.input "Download Packer? (y for yes)" ~= "y" then
      return
    end
  end

  local directory = string.format("%s/site/pack/packer/start/", vim.fn.stdpath "data")

  vim.fn.mkdir(directory, "p")

  local out = vim.fn.system(
    string.format("git clone %s %s", "https://github.com/wbthomason/packer.nvim", directory .. "/packer.nvim")
  )

  print(out)
  print "Downloading packer.nvim..."
  if options.force == false then
  print "( You'll need to restart now )"
  else
    vim.cmd("exit")
  end
end

return function()
  if not pcall(require, "packer") then
    --download_packer()

    return true
  end

  return false
end
