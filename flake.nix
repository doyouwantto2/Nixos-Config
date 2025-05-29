{
  description = "My NixOS configuration";

  inputs = {
      nixpkgs.url = "github:NixOs/nixpkgs/nixos-25.05";
  }

  outputs = { self, nixpkgs }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
      ];
    };
  };
}

