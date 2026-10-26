{ inputs, pkgs, luxos, ... }:

{
  imports = luxos.modules [ "unstable" ];

  luxos.inputs.noctalia = {
    url = "github:noctalia-dev/noctalia/v5.3.0";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  environment.systemPackages = [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
