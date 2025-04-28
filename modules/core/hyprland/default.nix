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
    ./programs.nix
    ./network.nix
    ./pipewire.nix
    ./program.nix
    ./service.nix
  ];

}