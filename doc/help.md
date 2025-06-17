# VIM Help

## Navigation

gg : Moves the cursor to the first line of the file.
:NUMBER : Goes to line number
0 (zero) : Moves to absolute beginning of the line
^ : Moves to the first non blank character of the line
+ : Moves to the first word in the next line
G : Moves to last line of file
$ : Moves to line end
f{char} F{char} : Moves the cursor to the first {char} to the (f)right (F)left of the line
    ; or , : (;)Repeats (,) Repeats opposite direction
w : Next word
b : Previous word or beginning of word if inside


@telescope : see below

## Enter Stuff

a : Append after cursor
A : Append on line end
o (small o): New line below and enters insert mode
O (big o): New line above and enters insert mode
yy : Copy line
p : Paste under cursor

## Correct Stuff

dd : Delete current line
diw or daw : delete inner word; delete 'a' word (with whitespace after word)
ce : Delete at cursor start to word end; Go in enter mode
cw : Delete the word under the cursor and go in enter mode
s : delete char at current cursor position and enters the input mode

## Search Stuff

/TEXT : Search forward
?TEXT : Search backwards
n : Jump to next hit
N : Jump to previous hit
* : Search for the word under the cursor. n/N for next hit

## Numver Stuff

Ctrl + a : increment   (10<C-a> for add 10)
Ctrl + x : decrement

## Between Apps Stuff

gg"+yG : Copy everything in clipboard. gg start; "+y in clipboard; G end of File
"+p : Paste from clipboard  

## File Stuff

@eunuch :Rename : File rename

## Telescope

Launch with :Telescope file_browser

### LSP Autocompletion

Ctrl+n or Ctrl+p : Go through completion list
Control + ] : jump to definition (use control + t to go back).
Control + x : then Control + o will trigger code completion menu.
Control + w : then d opens a floating window showing the error/warning message in the line under the cursor.
[d and ]d : can be used to move the cursor to the previous and next errors/warnings of the current file.
grn : renames all references of the symbol under the cursor.
gra : shows a list of code actions available in the line under the cursor.
grr : lists all the references of the symbol under the cursor.
gri : lists all the implementations for the symbol under the cursor.
Control + s : in insert mode displays the function signature of the symbol under the cursor. : Currently overwritten to save

### dot command

. : Repeat last command

After input the dot command repeats everything entered in the input mode.

### Change format

`>G` : Increases indentation

### Spellcheck

z= : Suggested fix
zg : Save word
zw : Delete word

## Nvim self

:restart : To restart nvim itself for config changes. Not yet in the version.
