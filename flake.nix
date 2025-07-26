{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    gitignore = {
      url = "github:hercules-ci/gitignore.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    gitignore,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
        packageJSON = pkgs.lib.importJSON ./package.json;
        gitignoreSource = gitignore.lib.gitignoreSource;
      in {
        packages.default = pkgs.mkYarnPackage rec {
          name = "${packageJSON.name}-site-${version}";
          version = packageJSON.version;
          src = gitignoreSource ./.;
          packageJson = "${src}/package.json";
          yarnLock = "${src}/yarn.lock";
          buildPhase = ''
            yarn --offline build
          '';

          distPhase = "true";

          installPhase = ''
            mkdir -p $out/share/web
            cp -r deps/${packageJSON.name}/dist/* $out/share/web/
          '';
        };

        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            nodejs
            yarn
            just
          ];
        };
      }
    );
}
