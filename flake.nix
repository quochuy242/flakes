{
    description = "quochuy242's NixOS Configuration";

    inputs = {
        nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
        nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        # Unofficial zen browser flake
        zen-browser.url = "github:MarceColl/zen-browser-flake";
    };

    outputs = { self, ... }@inputs: let    
        user = "quochuy242";
        hosts = [
            {
                hostname = "shiroly-nixos";
                stateVersion = "24.11";
                homeStateVersion = "24.11";
                system = "x86_64-linux";
            }
        ];

        makeSystem = { hostname, stateVersion, system }: inputs.nixpkgs.lib.nixosSystem {
            system = system;
            specialArgs = {
                inherit inputs stateVersion hostname user;
            };
            modules = [
                ./hosts/${hostname}/configuration.nix
            ];
        };
    in {
        # Generate NixOS configuration for each host
        nixosConfigurations = inputs.nixpkgs.lib.foldl' (configs: host: 
            configs // {
                "${host.hostname}" = makeSystem {
                    inherit (host) hostname stateVersion system;
                };
            }) {} hosts;

        # Home manager configuration
        homeConfigurations.${user} = inputs.home-manager.lib.homeManagerConfiguration {
                pkgs = inputs.nixpkgs.legacyPackages.${(builtins.head hosts).system};
                extraSpecialArgs = { 
                    inherit inputs user; 
                    homeStateVersion = (builtins.head hosts).homeStateVersion;
                };
                modules = [ ./hosts/${(builtins.head hosts).hostname}/home.nix ];
        };       
    };
}
