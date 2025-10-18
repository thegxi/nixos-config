{
  pkgs,
  pkgs-unstable,
  inputs,
  username,
  host,
  gpu,
  ...
}: 
#let
#  inherit (import ../../hosts/${host}/variables.nix) gitUsername;
#in 
{
  imports = [inputs.home-manager.nixosModules.home-manager];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = false;
    backupFileExtension = "backup";
    extraSpecialArgs = {inherit inputs username host gpu pkgs-unstable;};
    users.${username} = {
      home = {
        username = "${username}";
        homeDirectory = "/home/${username}";
        stateVersion = "25.05";
      };
      imports = [ ./../home ];
    };
  };
  users.mutableUsers = true;
  users.users.${username} = {
    isNormalUser = true;
    description = "thexi";
    extraGroups = [
      "docker"
      "networkmanager"
      "wheel" # sudo access
    ];
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
  };
  nix.settings.allowed-users = ["${username}"];
}
