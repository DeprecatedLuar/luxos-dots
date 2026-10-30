{ inputs, pkgs, ... }:

{
  luxos.inputs.jj-starship = {
    url = "github:dmmulroy/jj-starship";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  environment.systemPackages = [
    inputs.jj-starship.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
