{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    gpu-screen-recorder-gtk
    heroic
    libreoffice-fresh
    remmina
    vscode
    zotero

    # IDE
    android-studio
    jetbrains.datagrip

    # Theme app
    tela-icon-theme
    gnome-tweaks
    gnomeExtensions.caffeine
    gnomeExtensions.battery-health-charging
  ];
}