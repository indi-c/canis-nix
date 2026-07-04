{ config, lib, pkgs, inputs, outputs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../common
    ./configuration.nix
  ];

  networking.hostName = "canisX1";
  
  # You can add NTI-specific configuration here
}
