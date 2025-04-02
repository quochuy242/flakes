{ config, lib, pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./bat.nix
    ./btop.nix
    ./eza.nix
    ./fastfetch.nix
    ./foot.nix
    ./git.nix
    ./kitty.nix
    ./lazygit.nix
    ./neovim.nix
    ./obsidian.nix
    ./rofi.nix
    ./starship.nix
    ./tmux.nix
    ./vscode.nix
    ./waybar.nix
    ./wezterm.nix
    ./yazi.nix
    ./zathura.nix
  ];
}

