# General

This configuration is based of  [bbatsov's prelude](https://github.com/bbatsov/prelude).
And I also copied other people's configs.
eg: [Steve Purcell's emacs.d](http://github.com/purcell/emacs.d).

## Installation

```
git clone https://github.com/hookbrother/.emacs.d.git
```
If your had the directory named .emacs.d, delete it.

## Tree

The configuration tree is almost copied by bbatsov's prelude. Nevertheless, I still made ​​some changes according to my habits.

* init.el
* core

Houses the core feature divided by some files:

core-elpa.el-------------package manager

core-gui.el--------------GUI optimizations

core-editor.el-----------editing experience

core-gadgets.el----------some gadgets

core-modules.el----------manager the major modes
* modules

Stores all the mode frofiles may be used.

modules-markdown.el------Edit README

modules-prog.el----------programming

modules-python.el--------python programming

modules-c.el-------------c and c++ programming

modules-java.el----------java programming
* vendor

Stores all the plugins which not in the package-archives.

template-----------------auto generate some code when create a new file

git-emacs----------------use git in emacs


* elpa

Stores all the plugins which in the package-archives.
* personal

My personal info and settings, snippets also in this directory.
* save

Some history information like ido, smex.
## Package manager

Bbatsov install all the packages first in prelude-packages.el, and use them when need, but I think install the packages when they will be used is better, as purcell has done the same.

At last, I use the function require-package defined by purcell to install my packages.


## The third software may be used

* stardict sdcv
* xsel
* clang
* python-pip python-docs python-virtualenv

## And some python script must be installed by "pip install"

*cpplint elpy jedi
