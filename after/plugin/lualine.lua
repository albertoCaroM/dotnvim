pcall(function ()

  local ok, lualine = pcall(require, "lualine")
  if not ok then
    return
  end

  lualine.setup{
    options = {
      theme = 'nightfox',
      icons_enabled = true,
      globalstatus = true,
      section_separators = { left = '', right = '' },
      component_separators = { left = '', right = '' }
    },
    extensions = {'quickfix', 'fugitive'},
    sections = {
      lualine_a = { { 'mode', upper = true } },
      lualine_b = { { 'branch', icon = '' }, { 'db_ui#statusline' }, 'diff' },
      lualine_c = { { 'filename', file_status = true, path = 1 } },
      lualine_x = { { 'diagnostics', sources = { 'nvim_diagnostic' } },'encoding', 'fileformat', 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    },
    inactive_sections = {
      lualine_a = {  },
      lualine_b = {  },
      lualine_c = { 'filename' },
      lualine_x = { 'location' },
      lualine_y = {  },
      lualine_z = {  },
    },
  }


end)
