{ config, pkgs, ... }:
{
  ## Home-manager
  home-manager.users.tabun = {pkgs, ...}: {
    home.stateVersion = "22.11";  
    home.packages = with pkgs; [
      gnome-tweaks
      gnomeExtensions.caffeine
      gnomeExtensions.battery-health-charging

    ];
    programs.git = {
      enable = true;
      userEmail = "yurandarezky@atmaluhur.ac.id";
      userName = "Rezky Yuranda";
    }; 
    # Dconf
  dconf = {
    enable = true;
    settings = {
      #"org/gnome/desktop/interface".color-scheme = "prefer-dark";
        "org/gnome/mutter" = {
          experimental-features = [ "scale-monitor-framebuffer"  "xwayland-native-scaling" ];
        };
        "org/gnome/shell" = {
          disable-user-extensions = false;
          enabled-extensions = with pkgs.gnomeExtensions; [
            caffeine.extensionUuid
            battery-health-charging.extensionUuid
          ];
        };

        "org/gnome/desktop/interface" = {
          icon-theme = "Tela-light";
        };
      };
    };
  };
}
