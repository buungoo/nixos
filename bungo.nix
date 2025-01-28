{ config, pkgs, ... }:
let
  # home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz"
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.bungo = { pkgs, ... }: {
    home.stateVersion = "24.11";

    shell = pkgs.zsh;

    programs = {
      git = {
        enable = true;
	userName = "buungoo";
	userEmail = "bergdahl0101@gmail.com";
      };

      zsh = {
        enable = true;
	enableCompletion = true;
	autosuggestion.enable = true;
	syntaxHighlighting.enable = true;
	initExtra = ''
          eval "$(zoxide init zsh --cmd cd)"
        '';
      };

      zoxide = {
        enable = true;
	enableZshIntegration = true;
      };
    };
  };
}
