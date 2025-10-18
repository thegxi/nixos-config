{inputs, pkgs, ...}:
{
  home.packages = with pkgs; [
    swww swaybg wmname xwayland-satellite clash-verge-rev
  ];
}
