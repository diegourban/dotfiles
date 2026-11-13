# dotfiles for [@diegourban](https://github.com/diegourban)

macOS dotfiles stored in a bare Git repository (`~/.cfg`, work tree `$HOME`), following
[Atlassian's bare-repo approach](https://www.atlassian.com/git/tutorials/dotfiles).

## Install

1. Install Homebrew from [brew.sh](https://brew.sh/). It also installs the Xcode Command Line Tools, which provide `git` and `curl`.
2. Bootstrap the dotfiles:
   ```sh
   curl -fsSL https://raw.githubusercontent.com/diegourban/dotfiles/main/.bin/install.zsh | /bin/zsh
   ```
   It clones over HTTPS (no SSH key needed yet), switches `origin` to SSH for later pushes, backs up any
   file it would overwrite to `~/.config-backup/<timestamp>/`, and runs `brew bundle --file ~/.bin/Brewfile`.
   It is safe to re-run.
3. Create the machine-local files (never committed):

   | File | Sourced by | Holds |
   |---|---|---|
   | `~/.zshrc.local` | `~/.zshrc` | tokens and secrets as `export`s |
   | `~/.aliases.local` | `~/.aliases` | work-specific aliases |
   | `~/.gitconfig.local` | `~/.gitconfig` | machine-local git settings |

## Daily use

```sh
config status                 # what changed (untracked files are hidden on purpose)
config add ~/.zshrc && config commit -m "..." && config push
config add ~/.some/new/file   # start tracking a file
```

## Conventions

- **The repo is public.** No secrets, tokens, or employer-specific config in tracked files; those go in the `*.local` files.
  A `gitleaks` pre-commit hook (`~/.bin/hooks/`, wired via `core.hooksPath`) blocks commits that contain secrets.
- **Git identity is per directory.** The global `.gitconfig` has no `user.email` and sets `user.useConfigOnly`, so
  git refuses to commit unless an `includeIf` block (or a repo-local `user.email`) provides one.
- **Java** comes from the Temurin casks; switch with `jdk 17` / `jdk 25` (no argument lists installed JDKs).
- **Brewfile drift:** `brew bundle cleanup --file ~/.bin/Brewfile` lists what is installed but not tracked.
