{
  description = "IPNI projects";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];
      perSystem = { pkgs, ... }: {
        packages.ipni-storetheindex = pkgs.callPackage ./ipni-storetheindex.nix {};
        packages.ipni-index-provider = pkgs.callPackage ./packages/ipni-index-provider {};
        packages.ipni-cli = pkgs.callPackage ./ipni-cli.nix {};
      };
    };
}

