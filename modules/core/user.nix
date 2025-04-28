# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      # ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager
    ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tabun = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "audio" "video" "disk" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
    ];
  };

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    users.tabun = {
      imports = [ ./../home ];
      home.username = "tabun";
      home.homeDirectory = "/home/tabun";
      home.stateVersion = "24.05";
      programs.home-manager.enable = true;
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    wget
    jdk
    go
    nodejs
    wireguard-tools
  ];
}

