{ ... }:
{
  imports = [
    ../packages/lux-goodies/modern-unix.nix
    ../packages/lux-goodies/dev.nix
    ../services/caddy.nix
    ../services/docker.nix
    ../services/tailscale
    ../users/luar
    ../users/luar/modules/packages.nix
    ../extras.nix
    ../unstable.nix
    ./networking.nix
    ./packages.nix
    ./preferences.nix
  ];
}
