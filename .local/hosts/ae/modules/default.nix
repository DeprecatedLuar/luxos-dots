{ ... }:
{
  imports = [
    ./tailscale-funnel.nix
    ../users/user
    ../unstable.nix
    ./preferences.nix
  ];
}
