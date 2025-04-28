{ pkgs, ... }:
{
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settingg = {
    "$mod" = "SUPER";
     bind = [
       "$mod, F, exec, firefox"
       "$mod, Q, exec, kitty"
     ];
  };
}
