{
    config,
    pkgs,
    inputs,
    ...
}: {
    users.users.indicanis = {
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager"]; # Enable ‘sudo’ for the user.
        packages = [inputs.home-manager.packages.${pkgs.system}.default];
     };
     home-manager.users.indicanis =
     	import indicanis/${config.networking.hostname}.nix;
}
