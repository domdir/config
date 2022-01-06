ln -s ~/config/dotfiles/nu ~/.config
ln -s ~/config/.tmux.conf ~/.tmux.conf
as tmux
as neovim
as rust-analyzer
as libffi
as ripgrep
as npm
as icu
as unzip
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

curl -sLo /tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
unzip -p /tmp/win32yank.zip win32yank.exe | save /tmp/win32yank.exe
chmod +x /tmp/win32yank.exe
sudo mv /tmp/win32yank.exe /usr/local/bin
