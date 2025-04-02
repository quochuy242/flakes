{ config, lib, pkgs, ... }:
{
    imports = [
      ./R.nix
      ./cpp.nix
      ./python.nix
      ./golang.nix
      ./rust.nix
    ];
}
