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
  ];
}