local status, poimandres = pcall(require, "poimandres")
if not status then
  print("Colorscheme is not found")
end

poimandres.setup {
  bold_vert_split = false,
  dim_nc_background = false,
  disable_background = false,
  disable_float_background = false,
  disable_italics = false,
}

vim.cmd [["colorscheme poimandres"]]
