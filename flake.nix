{
  description = "A very basic flake";

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, ... } @ inputs: let
    system = "x86_64-linux";
    # Helper function to create a host configuration
    mkHost = { hostname, gpu, username }: nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit inputs;
        host = hostname;
        inherit gpu;
        inherit username;
        pkgs-unstable = import nixpkgs-unstable {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
      };
      modules = [
        ./gpus/${gpu}
      ];
    };
  in {
    nixosConfigurations = {
      # GPU-based configurations (legacy)
      nvidia = mkHost { hostname = "xi-nix"; gpu = "nvidia"; username = "xi"; };
      
      # Host-specific configurations
      xi-nix = mkHost { hostname = "xi-nix"; gpu = "nvidia"; username = "xi"; };
    };
  };
}
