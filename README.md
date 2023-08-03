# infinity-alacritty
## an infinity / darkslategrey themed alacritty config
---
Commands are to be executed on Windows
Powershell is compatible with Linux and MacOS, but you will have to install it yourself

To install:


- Download your favourite Monospace NerdFont, i like [JetBrains Mono Nerd Font](https://github.com/JetBrains/JetBrainsMono/releases/latest)
- Install it on your system
- On Windows:
    - Open Settings > Personalization > Fonts
    - Install the font by dragging and dropping the unzipped folder to "Add Fonts"
- Install [Alacritty](https://alacritty.org)
- Download the latest Installer

    ```powershell 
    ### TODO cd ~\Downloads; iwr -useb "https://raw.githubusercontent.com/LukasMarsch/infinity-alacritty/main/installer.ps1" | ni installer.ps1
    ```

- Now to customize colors, open your profile in your favourite code editor and start fumbling around

    ```powershell
    nvim $profile
    ```

next step: look at my [nvim](https://github.com/LukasMarsch/infinity-nvim) config to get a matching code editor experience :)
