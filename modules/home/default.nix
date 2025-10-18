{ inputs, host, ... }: let
  inherit (import ../../hosts/${host}/variables.nix) waybarChoice;
in {
  imports = [
    ./niri
    ./packages.nix
    ./terminal
    waybarChoice
    ./shell
    ./tofi
  ];
}
