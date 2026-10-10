{ inputs, pkgs, ... }:

{
  luxos.inputs.affinity = {
    url = "github:mrshmllow/affinity-nix";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  environment.systemPackages = [
    inputs.affinity.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
