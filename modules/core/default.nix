{
  inputs,
  nixpkgs,
  self,
  username,
  host,
  ...
}:
{
  imports = [
    ./bootloader.nix
    ./fonts.nix
    ./hardware.nix
    ./network.nix
    ./program.nix
    ./security.nix
    # ./services.nix
    ./system.nix
    ./user.nix
  ];
}