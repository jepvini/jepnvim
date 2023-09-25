# NVIM config in lua

*by jep*

### Dependencies:

nix -> for **lazy-lsp**

it can be installed running\
`$ curl -L https://nixos.org/nix/install | sh`

Dictionary can also be added for autocompletion, just place them in the `dicts` folder and add them with the `nvim-cmp` plugin

### Usage:

The leader key is `space`

In order to navigate pls don't be a n**b and use `hjkl`, this is not VScode

`Up` and `Down` keys have been disabled since they are sent by the terminal when the touchpad is accidentally touched while typing -- really annoying

### Keybindings

Disclaimer: The key notation is the same used by vim
- `a` -> press a
- `<leader>` -> press the leader key
- `<leader>a` -> press the leader key then a 
- `<C-a>` -> ctrl-a, at the same time

all the Keybindings are in normal mode, unless specified

### Base

- save file: `<leader>w`
- exit file without closing the window: `<leader>q`
- esc: `jk` -> insert mode

+ auto-indent all file: `<leader>g` 
+ next tab: `<leader>tl`
+ prev tab: `<leader>th`

- comment current line: `<leader>cc`
- add comment at the end of the line: `<leader>cA`
- commedt visual selected block: `<leader>b`

+ sort alphanumerically visual selected code: `<leader>s`

- yank to system keyboard: `cs`
- paste from system keyboard: `cv`

### Plugins

**nvim-tree** -> file manager
- toggle open-close: `<leader>e`
- expand folder or go to file: `L` *the file is open in a new tab*
- back: `H` 
- toggle hidden files: `gh`

 *telescope** -> fuzzy searcher
- search file in current buffer: `<leader><space>` *double tap space*
- search in reccent files: `<leader>r`
- search files in current dir: `<leader>ff`
- grep current dir: `<leader>fg` *uses ripgrep, written in rust:)*
- search in current file: `<leader>fs` *use this instead as classic vim `/`

+ open file in a new tab: `<C-t>`
+ open file in split: `<C-x>`
+ open file in vsplit: `<C-v>`

**toggle terminal** -> terminal (really???)
- toggle open-close: `<C-t>`

**nvim-cmp** -> autocomplete
- select highlighted: `<CR>` -> enter key
- next: `<Tab>`
- prev: `<S-Tab>`
- close: `<C-e>`
- show all words `<C-Space>` -> eng words appear only with more than 6 chars normally

**vim-surround** -> manages quotes, brackets etc
- add surround: `ys`
- rm surround: `rs`
- replace surround: `cs`

of what:
+ inner word (bounded by non letters): `iw`
+ inner Word (bounded by spaces): `iW`
+ etc. -> more in vim documentation 

what:
- quotes: `'`
- for replace: `'"` -> single with double

to replace single quotes with double of a Word is: `csiW'"`

### Useful vim std Keybindings

**Nice to know**
- repeat last action: `.`
- do action *n* times: `*n*<action>`
- undo: `u`
- redo: `<C-r>`
- merge two lines: `<S-j>`

delete 3 lines: `3dd` -> for more info about dd keep reading

**Commands** -> what you want to do
+ yank: `y`
+ paste: `p`
+ change: `c` -> delete and go in insert mode

- delete char under the cursor: `x` -> no select needed
- delete: `d`

+ capitalize: `gU`
+ make lowercase: `gu`

- find char next: `f<char>` -> no select needed
- find char prev: `F<char>` -> no select needed

**Select** -> on what
char
- under the cursor: `l`
- prev: `h`

word -> delimited by spaces or punctuation
- word from cursor to punctuation or space (included): `w`
- word from cursor to last char: `e` -> end
- word from cursor to first char: `b`

bigword -> delimited by spaces
*same as word but capitalized*

line
- from cursor to end: `$`
- from cursor to beginning: `0`
- from cursor to first non blank of the line: `^`

for current line just repeat the last letter:
- yank line: `yy`
- delete line: `dd`
- change line: `cc`
- capitalize line: `gUU` 

others lines:
- current line and previous: `k`
- current line and next: `j`

in and out:
- select whole word under the cursor: `iw`
- select whole word with surrounding spaces under the cursor: `aw`
- select text between quotes (without the quotes): `i'`
- select text between quotes (with the quotes): `a'`

whole file:
- top: `gg`
- bottom: `G`
 
**Move the cursor**
- page Up: `<C-f>` -> forward
- page Down: `<C-b>` -> back

- goto line: `3G` -> goto line 3
- goto top: `gg`
- goto EOF: `G`

all the inline movement are the same used for the **select section**
- goto next word: `w`
- goto end of line `$`
etc.

insert
+ before cursor: `i`
+ after cursor: `a`
+ to end of line: `A`
+ to beginning of line: `I`
+ black line below: `o`
+ blank line above: `O`

**visual mode** -> the most precise way of selecting things
- visual select char: `v`
- visual select whole line: `V`
- visual select block: `<C-v>`

+ indent selected: `>`
+ remove indentation selected: `<`

- insert in multiple lines: `<C-v><select lines><S-i><esc>`

**Panes**
- select pane mode: `<C-w>` -> then choose a direction using `hjkl`

**Macro** -> run the same list of actions multiple times
- record: `q`
- select buffer: `a` *for example*
- run commands
- stop recording: `q`
- run macro `@a` -> run macro in buffer a

**Search and replace**
+ in line first occurrence: `:s/foo/new_foo/`
+ in line all occurrence: `:s/foo/new_foo/g`
+ all file all occurrence: `:%s/foo/new_foo/`

**Change case**
- low to up: `gU`
- up to low: `gu`
- then select what you want to change
- selected char: `gUl`
- whole word: `gUiw`

**Auto indent**
+ indent:`=`
+ what:`G` -> till EOF
so to indent whole file and don't lose the cursor position: `gg=G''`

**Registers** -> vim has multiple keyboard registers
- select register key: `"`

numerical registers are used for yank and delete
`0` is the last register, then `1` and so on

`+` is the system register
yank line to system register: `"+yy`
paste from system register: `"+p` -> although this works `Control-Shift-v` is more convenient 
