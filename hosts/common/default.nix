# Common configuration for all hosts

{ lib, inputs, outputs, pkgs, ... }: {

  imports = [
  ./users
  inputs.home-manager.nixosModules.home-manager
  ];

  environment.systemPackages = with pkgs; [
      vim
      git
      wget
      hyprland
      gnome-keyring
      seahorse
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  security.pam.services.hyprland.enableGnomeKeyring = true;


  programs.thunar = {
    enable = true;
  };

  programs.xfconf = {
    enable = true;
    # settings = [];
  };

  services.gnome.gnome-keyring.enable = true;
  
  home-manager = {
      useUserPackages = true;
      useGlobalPkgs = true;
      extraSpecialArgs = {inherit inputs outputs;};
  };

  nixpkgs = {
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  nix = {
    settings = {
      experimental-features = ["nix-command" "nix-command flakes"];
      trusted-users = [
        "root"
        "indicanis"
      ]; # Set users that are allowed to use the flake command
    };
    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
    };
    optimise.automatic = true;
    registry = (lib.mapAttrs (_: flake: { inherit flake; }))
      ((lib.filterAttrs (_: lib.isType "flake")) inputs);
    nixPath = [ "/etc/nix/path" ];
  };

  # set shell to fish
  users.defaultUserShell = pkgs.fish;
  programs.fish.enable = true;
}
