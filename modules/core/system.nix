{
  self,
  pkgs,
  lib,
  inputs,
  ...
}:

{
  zramSwap.enable = true;
  time.timeZone = "Asia/Jakarta";
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.11"; # Did you read the comment?
  nix.settings.experimental-features = ["nix-command" "flakes"];
}