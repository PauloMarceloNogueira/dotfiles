# @gufranco does dotfiles

![DROP THE MIC](http://gifs.joelglovier.com/boom/mic-drop-2.gif)

These are my dotfiles. There are many like them, but these are mine. My dotfiles
are my best friend. They are my life. I must master them as I must master my
life. My dotfiles, without me, are useless. Without my dotfiles, I am useless.

## Stupid simple installation

```shell
if [[ "$(uname)" == "Linux" ]]; then
  wget -q -O - https://raw.githubusercontent.com/gufranco/dotfiles/master/install.sh | bash
else
  curl -fsSL https://raw.githubusercontent.com/gufranco/dotfiles/master/install.sh | bash
fi
```
