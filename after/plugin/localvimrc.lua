local nvimFolder= vim.env.HOME .. "/.config/nvim"
if vim.fn.has("win32") then
nvimFolder= vim.env.HOME .. "/AppData/Local/nvim"
end

vim.g.localvimrc_persistent=1
vim.g.localvimrc_persistence_file= nvimFolder .. "/lvimrc_persistent"
vim.g.localvimrc_ask=1



