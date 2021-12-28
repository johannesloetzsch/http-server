{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.11";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in
  rec {
    legacyPackages.${system} = {
      http-server = (import ./nix/default.nix { inherit pkgs system; })."@johannesloetzsch/http-server";
    };

    defaultPackage.x86_64-linux = legacyPackages.${system}.http-server;
  };
}
