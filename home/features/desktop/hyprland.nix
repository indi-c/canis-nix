{ config, pkgs, ... }:

let
  configFilesLocation = ./hyprland_config;

  baseConfig    = import "${configFilesLocation}/base_config.nix";
  animations    = import "${configFilesLocation}/animations.nix";
  binds         = import "${configFilesLocation}/binds.nix";
  colours       = import "${configFilesLocation}/colours.nix";
  decorations   = import "${configFilesLocation}/decoration.nix";
  environment   = import "${configFilesLocation}/env.nix";
  execs         = import "${configFilesLocation}/execs.nix";
  rules         = import "${configFilesLocation}/rules.nix";

  settingsSet = baseConfig //
             animations //
             binds //
             colours //
             decorations //
             environment //
             execs //
             rules;
in {
  wayland.windowManager.hyprland = {
    enable = true;
    settings = settingsSet;
  };
}