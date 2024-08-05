{
  description = "OliveIsAWord's personal flake templates";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  outputs = {
    self,
    nixpkgs,
  }: let
    supportedSystems = nixpkgs.lib.systems.flakeExposed;
    allSystems = output:
      nixpkgs.lib.genAttrs supportedSystems
      (system: output nixpkgs.legacyPackages.${system});
  in {
    templates = {
      rust = {
        path = ./rust;
        description = "Rust flake using cargo";
      };
    };
    formatter = allSystems (pkgs: pkgs.alejandra);
  };
}
