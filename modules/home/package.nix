{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    gpu-screen-recorder-gtk
    heroic
    libreoffice-fresh
    obsidian
    remmina
    vscode
    zotero

    # IDE
    android-studio
    jetbrains.datagrip
  ];
}
