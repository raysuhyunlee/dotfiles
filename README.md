# My dotfiles and personal cli settings

## Setup
```sh
$ git clone https://github.com/raysuhyunlee/dotfiles.git
$ cd dotfiles
$ ./install.sh
```

`install.sh` detects your OS (macOS / Ubuntu), installs packages, then symlinks
configs into your home dir. It's idempotent — safe to re-run — and backs up any
real files it would overwrite (`*.bak.<timestamp>`).

## What gets linked
| target | source |
| --- | --- |
| `~/.zshrc` | `dotfiles/zshrc` |
| `~/.zgen.zsh` | `dotfiles/zgen.zsh` |
| `~/.tmux.conf` | `dotfiles/tmux.conf` |
| `~/.config/nvim/init.vim` | `dotfiles/init.vim` |
| `~/.gitconfig` | `dotfiles/gitconfig` |
| `~/.scripts` | `scripts/` |

## CLI tools

### Core (installed by `install.sh`)
| tool | replaces | why |
| --- | --- | --- |
| [neovim](https://neovim.io/) | vim | the editor |
| [tmux](https://github.com/tmux/tmux) | — | terminal multiplexer |
| [oh-my-zsh](https://ohmyz.sh/) + [zgen](https://github.com/tarjoilija/zgen) | — | zsh framework + plugin loader |
| [fzf](https://github.com/junegunn/fzf) | — | fuzzy finder (`Ctrl-T` / `Ctrl-R` / `Alt-C`) |
| [fd](https://github.com/sharkdp/fd) | find | fast, gitignore-aware file search |
| [ripgrep](https://github.com/BurntSushi/ripgrep) (`rg`) | grep | fastest recursive search |
| [bat](https://github.com/sharkdp/bat) | cat | syntax highlight + paging |
| [eza](https://github.com/eza-community/eza) | ls | colors, git status, `--tree` |
| [zoxide](https://github.com/ajeetdsouza/zoxide) (`z`) | cd | jump to frecent dirs |
| [jq](https://github.com/jqlang/jq) | — | JSON slicing |
| [git-delta](https://github.com/dandavison/delta) | git diff pager | syntax-highlighted diffs |
| [gh](https://cli.github.com/) | — | GitHub PRs/issues from the CLI |

### Recommended extras (install as needed)
| tool | purpose |
| --- | --- |
| [btop](https://github.com/aristocratos/btop) | system monitor |
| [tealdeer](https://github.com/dbrgn/tealdeer) (`tldr`) | command cheatsheets |
| [lazygit](https://github.com/jesseduffield/lazygit) | git TUI |
| [yazi](https://github.com/sxyazi/yazi) | terminal file manager |
| [dust](https://github.com/bootandy/dust) | disk usage (`du`) |
| [duf](https://github.com/muesli/duf) | disk free (`df`) |
| [procs](https://github.com/dalance/procs) | process viewer (`ps`) |

## Docker compose

`docker-compose/` contains commonly used docker-compose files.
