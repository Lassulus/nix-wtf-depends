{
  description = "nix why-depends for dummies and lazy people";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = { nixpkgs, ... }:
    let
      supportedSystems = [
        "x86_64-linux"
        "i686-linux"
        "aarch64-linux"
        "riscv64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    in
    {
      packages = forAllSystems (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          nix-wtf-depends = pkgs.writeShellApplication {
            name = "nix-wtf-depends";
            runtimeInputs = [
              pkgs.fzf
              pkgs.jq
            ];
            text = builtins.readFile ./nix-wtf-depends;
          };
        in
        {
          inherit nix-wtf-depends;
          default = nix-wtf-depends;
        });
    };
}
