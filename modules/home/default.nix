{ inputs, host, ... }: let
  inherit (import ../../hosts/${host}/variables.nix) waybar-choice
in {
  imports = [
    ./niri.nix
    ./terminal
    waybar-choice
  ];
}
