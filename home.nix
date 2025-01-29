{ config, pkgs, ... }:

{
  home.username = "bungo";
  home.homeDirectory = "/home/bungo";

  home.stateVersion = "24.11"; # Read the docs before updating

  home.packages = [
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;
}
