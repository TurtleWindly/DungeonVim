# DungeonVim

Quick setup for neovim use vim-plug. This is not so good at a complete plugin. So just enjoy coding.

## Features
+ Home screen: vim-startify
+ Simple file manager with Vaffle.vim
  - Use `<leader>f` to open file explorer
  - File icon with vim-devicons
  - Not too complex so need to manually change window size
+ Theme: onedark-vim
+ Status bar: lighline-vim
+ Auto commenting: vim-auto-commenting
+ Auto pairs: auto-pairs
+ Fix trailing whitespace: vim-trailing-whitespace
+ Align text: vim-easy-align
+ Rainbow parenthese: rainbow_parenthese.vim
+ Text highlight: vim-todo-highlight
+ Syntax highlight:
  - cpp: vim-cpp-morden
  - lua: vim-lua
+ Code completion: coc.vim

## ScreenShots
Home screen when enter nvim

![Home Screen](https://github.com/TurtleWindly/DungeonVim/blob/main/ScreenShots/HomeScreen.PNG)

Custom Vaffle (don't mind about what project i am doing)

![Vaffle Screen](https://github.com/TurtleWindly/DungeonVim/blob/main/ScreenShots/VaffleScreen.PNG)

## Dowload
Current version the creator using is neovim 0.7.0 beta but 0.6.0 and maybe more version can be used. <br />
Replace this to init.vim.
Find init.vim path using this command in vim `:echo $MYVIMRC` <br />
Go into nvim and install all plugin with vim-plug `:PlugInstall`

## Code completion
All plugins above are simple with out dependencies except coc.vim. But belown this are guide to make it work with c/cpp and lua. If 
you want to have more auto complete support for
more programming langues you need to read coc.vim [documents](https://github.com/neoclide/coc.nvim). And [programming list](https://github.com/neoclide/coc.nvim/wiki/Language-servers) <br />

### Dependencies
Install [Node.js](https://nodejs.org/en/) >= 12.12
#### C++
In nvim run `:CocInstall coc-clangd`
Read more at [coc-clangd](https://github.com/clangd/coc-clangd). <br /> <br />
Cause the diagnostics aren't always true so here is away to disable it. In nvim use `:CocConfig`. it will take you to a setting json file.
In here check if you see the clangd.path. It maybe different. then add the
```json
{
  "clangd.path": "~\\AppData\\Local\\coc\\extensions\\coc-clangd-data\\install\\13.0.0\\clangd_13.0.0\\bin\\clangd.exe",
  "clangd.disableDiagnostics": true,
}
```
#### Lua
You can chose other [sever](https://github.com/neoclide/coc.nvim/wiki/Language-servers#lua) but personally I will use coc-sumeko-lua
In nvim run `:CocInstall coc-sumneko-lua` <br /> <br />
Diagnostics still anoying when you declare a lowercase global varible so to disable it simply go to coc-setting.json with `:CocConfig` in nvim.
```json
{
  "Lua.telemetry.enable": false,
   "diagnostics ": {
   "disable":  "lowercase-global"
   }
}
```
## Other plugin

### Auto commenting
You can add more comment type at line `146` in init.vim
```vim
" commenting
let g:inline_comment_dict = {
  \'//': ["js", "ts", "cpp", "c", "dart"],
  \'#': ['py', 'sh'],
  \'"': ['vim'],
  \'--': ['lua'],
  \}
```
### Fix trailing whitespace
All trailing whitespace will be highlighted with red
Fix that by command `:FixWhitespace`

### Align text
There is a keymap at line `143` in init.vim. Select lines then Enter after that press 2 space.
I only know that and it work well so you can check more at [here](https://github.com/bronson/vim-trailing-whitespace)
```vim
" Easy align interactive Enter than 2<space>
vnoremap <silent> <Enter> :EasyAlign<cr>
```

### Text highlight
Line `109` in init.vim. You can add more or delete none use text. The first pros is font color and the second is the background. Ex:
```vim
let g:todo_highlight_config = {
\   'TODO' {
\     'gui_fg_color': '#ffffff',
\     'gui_bg_color': 'FFB140',
\   },
\}
```

### Startify
For more configuration see at [vim-startify](https://github.com/mhinz/vim-startify). This will guide you to make custom header
with your ASCII art. Line `154` you can change the ascii. One important thing is if your art content single quotes `'` you so
complete it with another ' to have a pair of it. Vim will show it at one single quote. To understand more about this read [Strings](https://learnvimscriptthehardway.stevelosh.com/chapters/26.html)
in `Learn Vimscript the Hard Way` <br />

```vim
let g:ascii = [
\'    ____                                   _    ___         ',
\'   / __ \__  ______  ____ ____  ____  ____| |  / (_)___ ___ ',
\'  / / / / / / / __ \/ __ `/ _ \/ __ \/ __ \ | / / / __ `__ \',
\' / /_/ / /_/ / / / / /_/ /  __/ /_/ / / / / |/ / / / / / / /',
\'/_____/\__,_/_/ /_/\__, /\___/\____/_/ /_/|___/_/_/ /_/ /_/ ',
\'                  /____/                                    ',
\'',
\]

let g:startify_custom_header =
    \ 'startify#center(g:ascii + startify#fortune#boxed())'
```
