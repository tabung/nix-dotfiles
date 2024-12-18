# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./systems/hardware.nix
      ./modules/fonts.nix
      ./modules/sessions/battray.nix
    ];

    # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" ];

  # Networking
  networking.hostName = "dev0p"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Wiregurad
  networking.wireguard.enable = true;
 
  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Zram
  zramSwap.enable = true;

  # VGA
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [ amdvlk ];
    extraPackages32 = with pkgs; [ driversi686Linux.amdvlk];
  };

  # Set your time zone.
  time.timeZone = "Asia/Jakarta";

  # Power Manjement
  powerManagement.enable = true;
  services.tlp.enable = true;

  # Plasma
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.displayManager.defaultSession = "plasma";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Eanble scrub mweekly
  services.btrfs.autoScrub = {
    enable = true;
    interval = "monthly";
    fileSystems = [ "/" ];
  };

  # Enable sound.
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tabun = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "Rezky Yuranda";
    extraGroups = [ "wheel" "gamemode" "audio" "video" "disk" "docker" "libvirt"]; # Enable ‘sudo’ for the user.
    uid = 1000; # Make it default, so I can swap user
    packages = with pkgs; [
      tree
      kget
      kcalc
      isoimagewriter
    ];
  };

  # Sudo no password
  security.sudo.wheelNeedsPassword = false;
  
  # Allow untrue
  nixpkgs.config.allowUnfree = true;

  # System 
  environment.systemPackages = with pkgs; [
    vim
    vlc
    git
    zip
    unzip
    nodejs
    python3
    wget
    remmina
    android-studio
    obsidian
    libreoffice-qt
    hunspell
    hunspellDicts.en_US
    openjdk
    lutris
    telegram-desktop
    vscode
    jetbrains.phpstorm
    jetbrains.pycharm-professional
    jetbrains.jdk
    jetbrains.datagrip
    vulkan-tools
    wine
    kdePackages.sddm-kcm
  ];

  # Virtualization
  virtualisation.docker.enable = true;
  virtualisation.docker.storageDriver = "btrfs";
  virtualisation.libvirtd.enable = true;

  ## Virtualbox
  #virtualisation.virtualbox.host.enable = true;
  #users.extraGroups.vboxusers.members = [ "r3z" ];

  # Program
  programs.firefox.enable = true;
  programs.dconf.enable = true;
  programs.zsh.enable = true;
  programs.virt-manager.enable = true;
  programs.steam.enable = true;
  programs.gamemode.enable = true;
  
  system.stateVersion = "24.11"; # Did you read the comment?
  nix.settings.experimental-features = ["nix-command" "flakes"];

}

