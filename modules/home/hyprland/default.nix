{inputs, host, ...}: {
  imports = [
    ../git.nix
    ./hypr.nix
    ../kitty.nix
    ../package.nix
    ./package.nix
    ../zsh
  ];
}
