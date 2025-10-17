{ inputs, ... }:
{
  imports = [
    ./packages.nix
    ./sddm.nix
    ./stylix.nix
    ./user.nix
    ./xserver.nix
    inputs.stylix.nixosModules.stylix
  ];
}
