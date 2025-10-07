# Neovim setup based on lazyvim

**1. Install Neovim and prerequisite packages**
```
brew install lazygit
brew install tree-sitter-cli
brew install fzf
brew install ripgrep
brew install fd
brew install --cask font-0xproto-nerd-font
brew install neovim
```

**2. Clone repository to ~/.config/nvim directory**
```
mkdir -p ~/.config/nvim
git clone https://github.com/ajmal-amirzad/nvim.git ~/.config/nvim
```

**3. Install Lua 5.1 *(required for Lazy.Vim)***
- download Lua 5.1 source manually
- compile and link it under ~/.local/bin
```
curl --remote-name https://www.lua.org/ftp/lua-5.1.tar.gz
tar xzf lua-5.1.5.tar.gz
cd lua-5.1.5
make macosx
mkdir ~/lua
make INSTALL_TOP=$HOME/lua/lua@5.1 install
make INSTALL_TOP=$HOME/lua/lua install
mkdir -p ~/.local/bin
ln -s ~/lua/bin/lua ~/.local/bin/lua5.1
ln -s ~/lua/bin/lua ~/.local/bin/lua
brew install luarocks
```

**4. Export ~/.local/bin as path in .zshrc**
```
export PATH="$HOME/.local/bin:$PATH"
```

**5. Check Lua is working**
```
lua -v
luarocks --version
```

**6. Go Setup**
```
go install golang.org/x/tools/cmd/goimports@latest
go install mvdan.cc/gofumpt@latest
go install golang.org/x/tools/gopls@latest
go install github.com/go-delve/delve/cmd/dlv@latest
go install github.com/segmentio/golines@latest
```
