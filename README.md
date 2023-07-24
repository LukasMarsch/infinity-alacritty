# infinity-alacritty
## an infinity / darkslategrey themed alacritty config
---
Commands are to be executed in powershell
Configured for windows with pwsh

to install:

- Download the latest powershell version

    ```powershell
    winget install Microsoft.Powershell
    ```

- Download the [JetBrains Mono Nerd Font](https://github.com/JetBrains/JetBrainsMono/releases/latest)
- Open Settings > Personalization > Fonts
- Install the font by dragging and dropping the unzipped folder to "Add Fonts"
- Install [Alacritty](https://alacritty.org)
- Copy the alacritty.yml file from this directory to $HOME\AppData\Roaming\alacritty

    ```powershell
    mkdir ~\AppData\Roaming\alacritty | cd; iwr -useb "https://raw.githubusercontent.com/LukasMarsch/infinity-alacritty/main/alacritty.yml" | ni .\alacritty.yml
    ```

- Install [oh-my-posh](https://ohmyposh.dev/docs/installation/windows) for a beautiful terminal

    ```powershell
    winget install JanDeDobbeleer.OhMyPosh -s winget
    ```

- Open your config file in your favourite code editor

    ```powershell
    nvim $profile
    ```

And add the initial config for oh-my-posh

    oh-my-posh init pwsh --config '~\AppData\Local\Programs\oh-my-posh\themes\kushal.omp.json' | Invoke-Expression

To customize oh-my-posh look at [Themes](https://ohmyposh.dev/docs/themes) and [Customization](https://ohmyposh.dev/docs/installation/customize)

next step: look at my vim config to get a matching code editor experience :)
