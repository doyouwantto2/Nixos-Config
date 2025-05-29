{
  description = "My configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOs/nixpkgs/nixos-25.05";
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      lib = nixpkgs.lib;
    in {
      nixosConfigurations.nixos = lib.nixosSystem {
        inherit system;
	specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
        ];
      };

    };
}

