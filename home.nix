{ config, pkgs, ... }:

{
  # import file
  imports = [
    ./zsh.nix
  ];
  
  ## Home-manager
  home.stateVersion = "22.11";

  # Home packages
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

  # Git configuration
  programs.git = {
    enable = true;
    userEmail = "yurandarezky@atmaluhur.ac.id";
    userName = "Rezky Yuranda";
  };

  # Dconf settings
  dconf = {
    enable = true;
    settings = {
      # Uncomment and set this if you want to enable the dark theme
      # "org/gnome/desktop/interface".color-scheme = "prefer-dark";

      # Backgorund
      "org/gnome/desktop/background" = {
        color-shading-type = "solid";
        picture-uri = "file:///home/tabun/Pictures/minimal.jpg";
      };

      # GNOME Mutter settings
      "org/gnome/mutter" = {
        experimental-features = [
          "scale-monitor-framebuffer"
          "xwayland-native-scaling"
        ];
      };

      # GNOME Shell settings
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
          caffeine.extensionUuid
          battery-health-charging.extensionUuid
        ];
      };

      "org/gnome/shell/extensions/apps-menu" = {
        "show-apps-icon" = true; # Contoh pengaturan.
      };

      # GNOME Desktop Interface settings
      "org/gnome/desktop/interface" = {
        icon-theme = "Tela-light";
      };
    };
  };
}
