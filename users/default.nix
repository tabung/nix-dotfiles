{ config, pkgs, ... }:

{
  imports = [
    ./apps/terminal/kitty.nix
    ./apps/terminal/tmux.nix
    ./apps/terminal/sh.nix
    ./apps/terminal/nvim.nix
  ];
  
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "r3z";
  home.homeDirectory = "/home/r3z";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = [
  ];

  # plain files is through 'home.file'.
  home.file = {
    
  };


  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
