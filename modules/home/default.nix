{ config, lib, pkgs, ... }:
{
  imports = [
    ./dev
    ./program
    ./shell
    ./wm
  ];
}
