{ pkgs, host, ... }:
{
  networking.hostName = "nix0s"; 
  networking.wireguard.enable = true;
}