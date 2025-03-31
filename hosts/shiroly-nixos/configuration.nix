{ config, pkgs, ... }:

{
    # Import modularized configurations from the "modules" folder
    imports =
        [   
            ../../modules/nixos
            ./hardware-configuration.nix
        ];

    # Defines the system state version for compatibility with NixOS upgrades
    system.stateVersion = "24.11";  

    # Define the primary user account
    users.users.quochuy242 = {
        isNormalUser = true;   # Creates a non-root user
        home = "/home/quochuy242";  # Sets the user's home directory
        description = "quochuy242";  # A description for the user
        extraGroups = [ "networkmanager" "wheel" ];  # Grants sudo (wheel) and NetworkManager privileges
    };

    # Enable the X server for graphical interface
    services.xserver.enable = true;

    # Enable GDM (GNOME Display Manager) for login management
    services.xserver.displayManager.gdm.enable = true;

    # Enable the GNOME desktop environment
    services.xserver.desktopManager.gnome.enable = true;

    # Set up keyboard layout for X server
    services.xserver.xkb = {
        layout = "us";  # Default keyboard layout is US
        variant = "";  # No specific variant applied
    };

    # Configure PipeWire for audio management
    services.pipewire = {
        enable = true;          # Enable PipeWire
        alsa.enable = true;     # Enable ALSA support
        alsa.support32Bit = true;  # Enable 32-bit ALSA support
        pulse.enable = true;    # Enable PulseAudio compatibility
    };

    # Set the system time zone
    time.timeZone = "Asia/Ho_Chi_Minh";

    # Configure system-wide locale settings
    i18n.defaultLocale = "en_US.UTF-8";  # Default locale
    i18n.extraLocaleSettings = {
        LC_ADDRESS = "vi_VN";  # Vietnamese address format
        LC_IDENTIFICATION = "vi_VN";
        LC_MEASUREMENT = "vi_VN";  # Metric system
        LC_MONETARY = "vi_VN";  # Vietnamese currency format
        LC_NAME = "vi_VN";
        LC_NUMERIC = "vi_VN";  # Number formatting
        LC_PAPER = "vi_VN";  # Paper size settings
        LC_TELEPHONE = "vi_VN";  # Telephone formatting
        LC_TIME = "vi_VN";  # Time and date formatting
    };

    # Setup Vietnamese input method with Fcitx5 and Unikey
    i18n.inputMethod = {
        type = "fcitx5";  # Use fcitx5 for input method
        enable = true;
        fcitx5.addons = with pkgs; [ fcitx5-unikey ];  # Add Unikey for Vietnamese typing
    };

    # Configure network settings
    networking.hostName = "shiroly-nixos";  # Set system hostname
    networking.networkmanager.enable = true;  # Enable NetworkManager for network management

    # Enable OpenSSH server for remote access
    services.openssh.enable = true;

    # Configure system bootloader
    boot.loader.systemd-boot.enable = true;  # Use systemd-boot
    boot.loader.efi.canTouchEfiVariables = true;  # Allow EFI modifications

    # Enable Flakes and Nix command features
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Install system-wide packages
    environment.systemPackages = [ pkgs.home-manager ];
}
