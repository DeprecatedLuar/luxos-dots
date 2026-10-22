{ inputs, pkgs, ... }:

let
  antigravity = inputs.antigravity-nix.packages.${pkgs.stdenv.hostPlatform.system};
in
{
  luxos.inputs.antigravity-nix = {
    url = "github:jacopone/antigravity-nix";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  environment.systemPackages = [
    antigravity.default # Base App
    antigravity.google-antigravity-cli # CLI
  ];
}
