{
  description = "A highly customizable theme for vim and neovim";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, ... }@inputs:
    inputs.flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages."${system}";

        devShell = pkgs.mkShell {
          name = "nightfox";
          packages = with pkgs; [
            just
            stylua
          ];
        };

      in
      rec {
        inherit devShell;
      });
}

