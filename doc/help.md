# VIM Help

## Navigation

gg : Moves the cursor to the first line of the file.
G : Moves to last line of file

:NUMBER : Goes to line number
0 (zero) : Moves to absolute beginning of the line
^ : Moves to the first non blank character of the line
+ : Moves to the first word in the next line
$ : Moves to line end
f{char} F{char} : Moves the cursor to the first {char} to the (f)right (F)left of the line
    ; or , : (;)Repeats (,) Repeats opposite direction
w : Next word
b : Previous word or beginning of word if inside
e : To (next) word end
% : To matching bracket

---> Ctrl + o or Ctrl + i : Jump to last/previous position
Ctrl + d/u : Scroll half screen
Ctrl + f/b : Scroll full screen

**Buffer list**
[b or ]b : Go next/prev buffer
leader-space : Show buffer list @bufferlist
leader-1-9 : Go to tab @bufferlist

@telescope : see below

Flash - faster navigation in visible buffer
s : start flash

## Enter Stuff

a : Append after cursor
A : Append on line end
I : Insert on line beginning
o (small o): New line below and enters insert mode
O (big o): New line above and enters insert mode
yy : Copy line
p : Paste under cursor

Ctrl + o : Enter insert normal mode (normal mode for one action)
(insert) Ctrl + r : Enter from register / paste from register following up with 0 for register 0 or + sys clipboard. PluginX helps for preview!

gi : go to last insert position and enter insert mode
g; and g: : Goes through the change list

## Correct Stuff

**Normal mode**

dd : Delete current line
diw or daw : delete inner word; delete around a word
ce : Delete at cursor start to word end; Go in enter mode
cw : Delete the word under the cursor and go in enter mode
s : delete char at current cursor position and enters the input mode
r : Replace char. Remove char, enter insert mode, leave insert mode

:%s/toChange/newWord : replace everything in file (% everything; s substitute)

J : Join line from under the cursor to current line

** Insert mode **

Ctrl + h : Delete one char back (like backspace)
Ctrl + w : Delete back one word
Ctrl + u : Delete back to start of line

## Search Stuff

q/ : Open list with last search commands

:noh or leader-n : clear last highlight

/TEXT : Search forward
?TEXT : Search backwards
n and N : Jump to next/previous hit
* and # : Search for the word under the cursor. n/N for next hit. # backward

## Visual mode

v : Enter char visual mode ; Change to V to expand line selection
V : Enter line wise visual mode ; Change to v to shrink char selection
C-v : Enter block wise visual mode ; You get it
gv : Reselect last visual selection
o : Jump to other end of the slection

vit : Select the inner content of HTML/XML Tags

## Move screen

zz :  Center screen to current cursor position

## Fold with ufo

zc or zv : folds under curser or unfolds
zC or zV : folds all or unfoldd all

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

## Record

q + Register : Start recording
q : Leave : End recording

## Window/Split

:sp : Split current buffer
(telescope) Ctrl + l or j : Create window to the right or down

Ctrl + w = : Even the splits

### LSP

Ctrl+n or Ctrl+p : Go through completion list
Control + ] : jump to definition (use control + t to go back).
Control + x : then Control + o will trigger code completion menu.

Control + w d : opens a floating window showing the error/warning message in the line under the cursor.
[d and ]d : can be used to move the cursor to the previous and next errors/warnings of the current file.

grn : renames all references of the symbol under the cursor.
gra : shows a list of code actions available in the line under the cursor.
grr : lists all the references of the symbol under the cursor.
gri : lists all the implementations for the symbol under the cursor.
Control + s : in insert mode displays the function signature of the symbol under the cursor. : Currently overwritten to save

#### Blink

Ctrl + y : Accept current completion.

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

## Commands

Most following commands can be combined

:23,45p : Print the range of lines
visual + :p : Prints the current visual selection
:/pattern/+1,/pattern2/-1p : Prints the content between the patterns
:%p or :.p : Prints whole file or current file
:normal . : Use normal commands. Example: `A;<Esc>` Put ; at end of line. `VG` to select to file end and `:normal .` to place ; on every line

Use arrows after pressing ":" for last command / history - Enter some characters for filtered browsing like command line
q: : repeat last command. After `@:` use `@@` to repeat

:!cat % : run a shell command - % is placeholder for filename in vim
:w | !cat % : Pipe to chain commands in vim

q: : To go to the command history list. Edit it like a normal buffer - which is a normal buffer

## oil 

g? : To show oil help
