(setq gc-cons-threshold (* 64 1024 1024))
(setq read-process-output-max (* 8 1024 1024))

(setq package-enable-at-startup nil)
(if (eq system-type 'darwin)
    (setenv "PATH" "$HOME/.bun/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/opt/X11/bin:/Library/Apple/usr/bin:/usr/local/share/dotnet:$HOME/.dotnet/tools:/Applications/quarto/bin:$HOME/.pyenv/shims:$HOME/.local/bin:$HOME/bin:/Library/TeX/texbin:/Applications/kitty.app/Contents/MacOS:$HOME/Library/Application Support/JetBrains/Toolbox/scripts:$HOME/.local/share/neovim/bin:$HOME/.cargo/bin:$HOME/Library/Python/3.10/lib/python/site-packages:$HOME/.antigen/bundles/zsh-users/zsh-syntax-highlighting:$HOME/.antigen/bundles/zsh-users/zsh-autosuggestions:$HOME/.antigen/bundles/denysdovhan/spaceship-prompt:/Applications/Ghostty.app/Contents/MacOS:$HOME/.lmstudio/bin:$HOME/.local/share/bob/nvim-bin:$HOME/.antigen/bundles/zsh-users/zsh-completions:/opt/homebrew/opt/fzf/bin")
  (setq exec-path (split-string (getenv "PATH") path-separator)))
