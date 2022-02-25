![Screenshot](https://github.com/madhatter/vim/raw/master/screenshot.png "screenshot")

## Howto build on OS X
1. `python3-config --configdir` to get the correct Python library directory
2. `./configure --disable-gui --disable-nls --enable-cscope \
   --with-modified-by=madhatter --disable-gpm --enable-multibyte \
   --prefix=/usr/local --with-features=normal --enable-rubyinterp \
   --enable-python3interp --with-python3-command=python3.9 \
   --with-python3-config-dir=/opt/homebrew/opt/python@3.9/Frameworks/Python.framework/Versions/3.9/lib/python3.9/config-3.9-darwin`
3. `make`
4. `sudo make install`

