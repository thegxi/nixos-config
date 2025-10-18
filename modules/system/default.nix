{ inputs, ... }:
{
  imports = [
    ./configuration.nix
    ./hardware.nix
    ./hardware-configuration.nix
  ];
}
