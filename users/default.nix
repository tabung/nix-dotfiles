{ config, pkgs, ... }:

{
  imports = [
    ./apps/terminal/kitty.nix
    ./apps/terminal/tmux.nix
    ./apps/terminal/sh.nix
    ./apps/terminal/nvim.nix
    #./apps/burpsuite/default.nix
  ];
  
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "tabun";
  home.homeDirectory = "/home/tabun";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = [
  ];

  programs.git = {
    enable = true;
    userEmail = "yurandarezky@atmaluhur.ac.id";
    userName = "tabung";
  };

  # Allow unfree
  nixpkgs.config.allowUnfree = true;

  # plain files is through 'home.file'.
  home.file = {
    
  };


  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
