# Untitled.vim

This is [Project Sekai](https://pjsekai.sega.jp/) inspired __unofficial__ vim plugin.

<!-- ![Untitled](images/untitled.gif) -->
<img src=images/untitled.gif width="70%">

## Requirements

- **random number generator** or **reltime**
```vim
echo exists('*rand') " == 1
" or
echo has('reltime')  " == 1
```
- **popup window** for vim
```vim
echo has('popupwin')  " == 1
```

## Installation

If you use [dein](https://github.com/Shougo/dein.vim),
```vim
call dein#add('MeF0504/untitled.vim')
```
[vim-plug](https://github.com/junegunn/vim-plug),
```vim
Plug 'MeF0504/untitled.vim'
```
or do something like this.

## Usage

The following command
```vim
Untitled
```
will lead you to your "sekai"

## TODO

* Recreate the new effect in this plugin.
* Support sound effect (maybe..)
