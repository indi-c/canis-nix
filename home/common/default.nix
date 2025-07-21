{ config, lib, outputs, pkgs, ... }: {
  # nixpkgs configuration is handled at the system level when using useGlobalPkgs

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
    };
  };
}
