# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/fonts.nix
      ./modules/sessions/battray.nix
    ];

  # Latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "devzc0de"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
 
  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # VGA
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Set your time zone.
  time.timeZone = "Asia/Jakarta";

  # Plasma
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.displayManager.defaultSession = "plasma";
  services.displayManager.sddm.wayland.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.r3z = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "Rezky Yuranda";
    extraGroups = [ "wheel" "audio" "video" "disk" "docker"]; # Enable ‘sudo’ for the user.
    uid = 1000; # Make it default, so I can swap user
    packages = with pkgs; [
      tree
    ];
  };
  
  
  # Allow untrue
  nixpkgs.config.allowUnfree = true;

  # System 
  environment.systemPackages = with pkgs; [
    vim
    git
    nodejs
    python3
    wget
    remmina
    alacritty
    obsidian
    libreoffice-qt
    hunspell
    hunspellDicts.en_US
    heroic
  ];

  # Virtualisation
  # Virtualization
  virtualisation.docker.enable = true;
  virtualisation.docker.storageDriver = "btrfs";
  virtualisation.libvirtd.enable = true;

  # Program
  programs.firefox.enable = true;
  programs.dconf.enable = true;
  programs.zsh.enable = true;
  programs.virt-manager.enable = true;
  programs.steam.enable = true;
  
  system.stateVersion = "24.05"; # Did you read the comment?
  nix.settings.experimental-features = ["nix-command" "flakes"];

}

