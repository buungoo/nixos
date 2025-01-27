{ config, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.bungo = { pkgs, ... }: {
    home.stateVersion = "25.05";

    programs = {
      git = {
        enable = true;
	userName = "buungoo";
	userEmail = "bergdahl0101@gmail.com";
      };
    };
  };
}
