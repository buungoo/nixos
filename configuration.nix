{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./fans.nix
    ];

  networking = {
    hostname = "nas0";
    networkmanager.enable = true;
    firewall.enable = true;
  };

  boot.loader = {
	efi.canTouchEfiVariables = true;

        # Set how long we wait at build screen
        timeout = 1;

        systemd-boot.enable = true;

        # Sets the resolution of the boot screen
        systemd-boot.consoleMode = "max";

        # Disable the bootloader editor for security
        systemd-boot.editor = false;
  };

  time.timeZone = "Europe/Stockholm";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "sv_SE.UTF-8";
      LC_IDENTIFICATION = "sv_SE.UTF-8";
      LC_MEASUREMENT = "sv_SE.UTF-8";
      LC_MONETARY = "sv_SE.UTF-8";
      LC_NAME = "sv_SE.UTF-8";
      LC_NUMERIC = "sv_SE.UTF-8";
      LC_PAPER = "sv_SE.UTF-8";
      LC_TELEPHONE = "sv_SE.UTF-8";
      LC_TIME = "sv_SE.UTF-8";
    };
  };

  services.xserver.xkb = {
    layout = "se";
    variant = "nodeadkeys";
  };

  console.keyMap = "sv-latin1";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.bungo = {
    isNormalUser = true;
    description = "bungo";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      neovim
      git
      zsh
    ];
    shell = pkgs.zsh;
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
  ];


  # Enable virtualisation through docker
  virtualisation = {
    docker = {
      enable = true;
      storageDriver = "btrfs";
      autoPrune = {
        enable = true;
	dates = "weekly";
      };
    };
  };

  services = {
    openssh.enable = true;
  };

  programs = {
    zsh.enable = true;
  };

  system.stateVersion = "24.11"; # Read docs before considering updating
}
