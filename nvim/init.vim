set clipboard=unnamedplus
set tabstop=4
set shiftwidth=4
set autoindent
set breakindent
set linebreak
set expandtab
set number
set foldmethod=indent
set nofoldenable
set spell
set cursorline


lua << EOF
function is_gnome_dark_mode()
  local handle = io.popen("gsettings get org.gnome.desktop.interface color-scheme")
  if handle then
    local result = handle:read("*a")
    handle:close()
    return result:match("dark") ~= nil
  end
  return false
end
if is_gnome_dark_mode() then
  vim.o.background = "dark"
else
  vim.o.background = "light"
end
EOF
