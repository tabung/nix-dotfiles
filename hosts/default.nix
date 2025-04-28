{ pkgs, config, de, ... }:
let
  # Tentukan modul desktop yang ingin dimuat berdasarkan pilihan 'de'
  desktopModules = if de == "hyprland" then [
    ../modules/core/hyprland
  ] else if de == "gnome" then [
    ../modules/core/gnome
  ] else [];
in
{
  imports = [
    ./hardware-configuration.nix
    ./../modules/core
  ] ++ desktopModules;
}