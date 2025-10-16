{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./host-packages.nix
  ];

  # Enable sddm display manager
  services.displayManager.sddm.enable = true;

  # Enable niri window manager
  programs.niri.enable = true;

  # Keep niri available at system level
  programs.niri.package = pkgs.niri;

  # Ensure niri session is available to display manager
  services.displayManager.sessionPackages = [ pkgs.niri ];
}
