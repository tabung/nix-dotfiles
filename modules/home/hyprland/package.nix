{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    bluez
    wofi
  ];
}
