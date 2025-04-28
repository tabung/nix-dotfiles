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
    ./network.nix
    ./pipewire.nix
    ./program.nix
    ./service.nix
  ];

}