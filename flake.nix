{
  description = "My NixOS configuration";

  inputs = {
      nixpkgs.url = "github:NixOs/nixpkgs/nixos-unstable";

      nixcats.url = "github:jordanisaacs/nixcats";
      nixcats.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixcats, ... }:
  let 
    system = "x86_64-linux";
  in
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
      ];
    };
    
    packages.${system}.nixcats = nixcats.packages.${system}.default;
  };
}

