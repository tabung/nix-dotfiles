{ pkgs, inputs, ... }:
{
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
          easyScreenCast.extensionUuid
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