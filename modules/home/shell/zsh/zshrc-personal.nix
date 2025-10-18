{pkgs, ...}: {
  home.packages = with pkgs; [zsh];

  home.file."./.zshrc-personal".text = ''

  # This file allows you to define your own aliases, functions, etc
  # below are just some examples of what you can use this file for

    #!/usr/bin/env zsh
    # Set defaults
    export PATH=/home/don/Development/Repos/flutter/bin:$PATH
    export CHROME_EXECUTABLE=${pkgs.google-chrome}/bin/google-chrome
    export CHROME_EXECUTABLE=/run/current-system/sw/bin/google-chrome-stable
    export PATH="$HOME/.local/bin:$PATH"
    export PATH="$PATH":"$HOME/.pub-cache/bin"
    export BROWSER="flatpak run app.zen_browser.zen"

    #
    export EDITOR="zeditor"
    #export VISUAL="nvim"

    #alias c="clear"
    #eval "$(zoxide init zsh)"
    #eval "$(oh-my-posh init zsh --config $HOME/.config/powerlevel10k_rainbow.omp.json)"

  '';
}
