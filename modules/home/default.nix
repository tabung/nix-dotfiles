{inputs, host, ...}: {
  imports = [
    ./git.nix
    ./gtk.nix
    ./package.nix
    ./zsh
  ];
}