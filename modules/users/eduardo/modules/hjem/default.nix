{ inputs, ... }:

{
  luxos.inputs.hjem = {
    url = "github:feel-co/hjem";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  imports = [
    inputs.hjem.nixosModules.default
    ./config
  ];

  hjem.clobberByDefault = true;

  hjem.users.eduardo = {
    user = "eduardo";
    directory = "/home/eduardo";
  };
}
