# Other Setup

# Needs to work

zig : choco install zig

Like setup ripgrep with one filetypes

## ripgre rg

Keymap example: <leader>fg

Use `rg return -ttypescript` Filter for typescript files
Add file type to us type lists: `rg --type-add 'web:*.{html,css,js}' -tweb title`
But this command is not persistent! We need to use the enviroment variable `RIPGREP_CONFIG_PATH` to
the file we want, for example `$HOME\.ripgreprc`. Every line is an shell argument.

Currently just checked in the file and point it there. No need to create the file.
