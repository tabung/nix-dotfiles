{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;
  };
}

