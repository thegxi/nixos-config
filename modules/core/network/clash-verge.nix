{ config, pkgs, ... }:
{
  programs.clash-verge = {
    enable = true;
    package = pkgs.clash-verge-rev;
    tunMode = true;
  };
}
