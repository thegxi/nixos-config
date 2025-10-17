{ inputs, ... }:
{
  imports = [
    ./configuration.nix
    inputs.stylix.nixosModules.stylix
  ];
}
