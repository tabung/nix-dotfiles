{ pkgs, ... }:
{
  programs.hyprland.enable = true;
  # programs.hyprland = {
  #   enable = true;
  #   withUWSM = true; # recommended for most users
  #   xwayland.enable = true; # Xwayland can be disabled.
  # };
}
