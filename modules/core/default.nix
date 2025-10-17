{ inputs, ... }:
{
  imports = [
    ./user.nix
    ./xserver.nix
    ./sddm.nix
    ./packages.nix
    inputs.stylix.nixosModules.stylix
  ];
}
