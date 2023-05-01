<div align="center">

# Dotfiles

![Latest commit](https://img.shields.io/github/last-commit/julian-poidevin/dotfiles?style=flat)

My dotfiles for `arch-linux`. Managed by [`chezmoi`](https://github.com/twpayne/chezmoi).

[Deployment](#Deployement) • [Zsh](#zsh) •

<picture>
  <img alt="" src="https://github.com/julian-poidevin/dotfiles/blob/main/docs/screenshots/dark.png">
</picture>
</div>

## Feature
### Deployement
* If using Bitwarden, login using :

  ```sh
  export BW_SESSION=$(bw login $BITWARDEN_EMAIL --raw)
  ```

* Deploy with shell one-liner:
    ```sh
    sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply julian-poidevin
    ```

### Zsh
