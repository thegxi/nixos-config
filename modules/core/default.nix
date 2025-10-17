{ inputs, ... }:
{
  imports = [
    ./user.nix
    inputs.stylix.nixosModules.stylix
  ];
}
