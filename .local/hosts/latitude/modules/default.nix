{ ... }:
{
  imports = [
    ../desktop/compositors/gnome.nix
    ../desktop/greeters/gdm
    ../packages/firefox.nix
    ../packages/brave.nix
    ../packages/office.nix
    ../services/tailscale
    ../users/luar
    ../users/paty
    ./preferences.nix
  ];
}
