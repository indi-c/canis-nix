{
  description = ''
  a basic flake based configuration for NixOS
  '';

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
    oxcgen = {
      url = "github:indi-c/oxcgen";
    };
  };

  outputs = { self, home-manager, nixpkgs, oxcgen, ... }@inputs:
    let
      inherit (self) outputs;
      systems = [
        "aarch64-linux"
        "i686-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
      # make an overlay to add custom packages no importing files
      overlays = system: [
        (final: prev: {
          oxcgen = inputs.oxcgen.packages.${system}.default; # Get oxcgen from the flake input
          additions = prev.additions or {} // {
            oxcgen = final.oxcgen; # add oxcgen to the additions
          };
        })
      ];

      pkgs = forAllSystems (system: import nixpkgs {
        inherit system;
        overlays = overlays system;
      });
      
    in {
      nixosConfigurations = {
        NLI = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs outputs; };
          modules = [ 
            ./hosts/NLI
            {
              nixpkgs.overlays = overlays "x86_64-linux";
            }
          ];
        };

        NTI = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs outputs; };
          modules = [ 
            ./hosts/NTI
            {
              nixpkgs.overlays = overlays "x86_64-linux";
            }
          ];
        };
      };
      homeConfigurations = 
        let
          mkHome = system: homeFile: home-manager.lib.homeManagerConfiguration {
            pkgs = pkgs.${system};
            extraSpecialArgs = { inherit inputs outputs; };
            modules = [ homeFile ];
          };
          
          # Define machines and their corresponding home files
          machines = {
            "NLI" = { system = "x86_64-linux"; homeFile = ./home/indicanis/NLI.nix; };
            "NTI" = { system = "x86_64-linux"; homeFile = ./home/indicanis/NTI.nix; };
          };
        in 
          # Generate home configurations for each machine
          builtins.listToAttrs (
            builtins.map (machine: {
              name = "indicanis@${machine}";
              value = mkHome machines.${machine}.system machines.${machine}.homeFile;
            }) (builtins.attrNames machines)
          );
    };
}
