{ inputs, ... }:

{
  luxos.inputs.nix-flatpak = {
    url = "github:gmodena/nix-flatpak/?ref=latest";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  # Dorion's published Flatpak asset is version-named. Update this input URL
  # to the next release, then run `luxos flake update` to refresh its lock pin.
  luxos.inputs.dorion-flatpak = {
    url = "https://github.com/SpikeHD/Dorion/releases/download/v7.0.1/Dorion_7.0.1.flatpak";
    flake = false;
  };

  imports = [ inputs.nix-flatpak.nixosModules.nix-flatpak ];

  services.flatpak = {
    enable = true;
    packages = [
      {
        appId = "com.spikehd.dorion";
        bundle = inputs.dorion-flatpak.outPath;
        sha256 = inputs.dorion-flatpak.narHash;
      }
    ];
  };
}
