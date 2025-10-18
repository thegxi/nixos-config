{ inputs, ... }:
{
  imports = [
    ./network
    ./packages.nix
    ./sddm.nix
    ./system.nix
    ./stylix.nix
    ./user.nix
    ./xserver.nix
    inputs.stylix.nixosModules.stylix
  ];
}
