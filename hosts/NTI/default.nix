{ config, lib, pkgs, inputs, outputs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../common
    ./configuration.nix
  ];

  networking.hostName = "NTI";
  
  # You can add NTI-specific configuration here
}
