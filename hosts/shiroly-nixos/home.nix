{ config, pkgs, ... }:

{
    imports = [
        ../../modules/home/
    ];
    nixpkgs.config.allowUnfree = true;
    home = {
        username = "quochuy242";
        homeDirectory = "/home/quochuy242";
        stateVersion = "24.11";
        packages = with pkgs; [
            # Desktop app
            imv
            mpv
            vscode
            brave
            inputs.zen-browser.packages.x86_64-linux.default # Unofficial Zen-browser flakes
            obs-studio
            obisidian
            pavucontrol
            telegram-desktop
            spotify

            # CLI
            atuin
            btop
            brightnessctl
            cliphist
            fastfetch
            ffmpeg
            fzf
            grimblast
            hyprpicker
            playerctl
            repgrep
            unzip
            wget
            curl
            starship
            wl-clipboard
            yt-dlp
            zip
            eza
            bat 
            tmux

            # Code stuff
            rustup
            python3
            R

            # Terminal
            foot
            kitty
            alacritty

            # WM
            dunst
            xdg-desktop-portal-gtk
            xdg-desktop-portal-hyprland

            # Other
            bemoji 
            fcitx5        # Input method framework
            fcitx5-unikey # Vietnamese input support
            fcitx5-gtk    # GTK integration for Fcitx5
        ]
    };
}
