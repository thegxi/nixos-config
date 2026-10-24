_: {
  programs.alacritty = {
    enable = true;
  };

  programs.alacritty.settings = {
    font = {
      normal.family = "Maple Mono NF CN";
      normal.style = "Normal";
      size = 14.0;
    };
  };

  catppuccin.alacritty = {
    enable = true;
    flavor = "mocha";
  };
}
