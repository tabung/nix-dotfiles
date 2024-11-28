# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/042f9346-117e-491d-9016-cef58625042e";
      fsType = "btrfs";
      options = [ "subvol=@root" "compress=zstd"];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/042f9346-117e-491d-9016-cef58625042e";
      fsType = "btrfs";
      options = [ "subvol=@home" "compress=zstd"];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/042f9346-117e-491d-9016-cef58625042e";
      fsType = "btrfs";
      options = [ "subvol=@nix" "compress=zstd" "noatime"];
    };

  fileSystems."/mnt/data" =
    { device = "/dev/disk/by-uuid/042f9346-117e-491d-9016-cef58625042e";
      fsType = "btrfs";
      options = [ "subvol=@data" "compress=zstd"];
    };

  fileSystems."/swap" =
    { device = "/dev/disk/by-uuid/042f9346-117e-491d-9016-cef58625042e";
      fsType = "btrfs";
      options = [ "subvol=@swap" "noatime"];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/ECAD-07B2";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  swapDevices = [ { device = "/swap/swapfile"; } ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp1s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
