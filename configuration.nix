# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./systems/hardware.nix
      ./modules/fonts.nix
      ./modules/sessions/battray.nix
    ];

  # Bootloader.
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

  # VGA
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [ amdvlk ];
    extraPackages32 = with pkgs; [ driversi686Linux.amdvlk];
  };

  # Set your time zone.
  time.timeZone = "Asia/Jakarta";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Plasma
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.displayManager.defaultSession = "plasma";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Tlp
  services.power-profiles-daemon.enable = false;
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 20;

       #Optional helps save long term battery health
     START_CHARGE_THRESH_BAT0 = 60; # 40 and bellow it starts to charge
     STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging
    };
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tabun = {
    isNormalUser = true;
    description = "Rezky Yuranda";
    extraGroups = [ "networkmanager" "wheel" "audio" "video" "gamemode" "docker" "libvirt" ];
    packages = with pkgs; [
      kdePackages.kate
      kdePackages.sddm-kcm
      kdePackages.kget
      kdePackages.kcalc
    ];
  };


  # Allow unfree packages
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
    obsidian
    libreoffice-qt
    hunspell
    hunspellDicts.en_US
    openjdk
    lutris
    telegram-desktop
    vscode
    vscode
    android-studio
    jetbrains.phpstorm
    jetbrains.pycharm-professional
    jetbrains.jdk
    jetbrains.datagrip
    jetbrains.goland
    vulkan-tools
  ];

  # Program
  programs.firefox.enable = true;
  programs.dconf.enable = true;
  programs.zsh.enable = true;
  programs.virt-manager.enable = true;
  programs.steam.enable = true;
  programs.gamemode.enable = true;  

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
  nix.settings.experimental-features = ["nix-command" "flakes"];

}
