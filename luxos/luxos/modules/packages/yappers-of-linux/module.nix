{ inputs, pkgs, ... }:

{
  luxos.inputs.yappers-of-linux = {
    url = "github:DeprecatedLuar/yappers-of-linux";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  luxos.inputs.tcpeek = {
    url = "github:DeprecatedLuar/tcpeek";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  luxos.inputs.borderline-lsd = {
    url = "github:DeprecatedLuar/borderline-lsd";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  environment.systemPackages = [
    inputs.yappers-of-linux.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
