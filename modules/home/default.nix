{ inputs, host, ... }: let
  inherit (import ../../hosts/${host}/variables.nix) waybarChoice
in {
  imports = [
    ./niri.nix
    ./terminal
    waybarChoice
  ];
}
