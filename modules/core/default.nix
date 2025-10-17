{ inputs, ... }:
{
  imports = [
    ./user.nix
    ./xserver.nix
    ./sddm.nix
    inputs.stylix.nixosModules.stylix
  ];
}
