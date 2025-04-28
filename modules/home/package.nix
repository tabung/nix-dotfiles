{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    remmina
    heroic
    vscode
    libreoffice-fresh
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