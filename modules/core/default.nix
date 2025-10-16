{ inputs, ... }:
{
  ./user.nix
  inputs.stylix.nixosModules.stylix
}
