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
    ./hardware.nix
    ./network.nix
    ./pipewire.nix
    ./program.nix
    ./service.nix
  ];

}
