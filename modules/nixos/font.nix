{ config, pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true; # Keep the default fonts of NixOS

    packages = with pkgs; [
        (nerdfonts.override {
            fonts = [
                "JetBrainsMono"
                "Lilex"
                "IosevkaTerm"
                "Iosevka"
            ];
        })
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-emoji
        dejavu_fonts
        fontconfig
        
    ];

    fontconfig = {
      enable = true; 

      defaultFonts = {
        # Ex: monospace = [ "JetBrains Mono" "Hack" ];
        serif = [ "Noto Serif" "DejaVu Serif" ];
        sansSerif = [ "Noto Sans" "DejaVu Sans" ];
        monospace = [ "JetBrainsMono Nerd Font" "Lilex Nerd Font" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
