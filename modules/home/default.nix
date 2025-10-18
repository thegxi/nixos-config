{ inputs, host, ... }: let
  inherit (import ../../hosts/${host}/variables.nix) waybarChoice;
in {
  imports = [
    ./lazygit.nix
    ./network
    ./niri
    ./packages.nix
    ./terminal
    ./tofi.nix
    waybarChoice
    ./shell
  ];
}
