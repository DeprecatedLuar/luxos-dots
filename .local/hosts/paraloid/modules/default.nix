{ ... }:
{
  imports = [
    ../packages/lux-goodies/gaming.nix
    ../devices/laptop
    ../devices/tablet.nix
    ../desktop/compositors/hyprland.nix
    ../packages/lux-goodies/desktop-apps.nix
    ../packages/lux-goodies/modern-unix.nix
    ../users/luar
    ../extras.nix
    ../packages/lux-goodies/dev.nix
    ../unstable.nix
    ./networking.nix
    ./packages.nix
    ./preferences.nix
    ../packages/yappers-of-linux
    ../vimsanity
    ../services/tailscale
    ../services/tailsocks
    ../desktop/greeters/ly.nix
    ../packages/obs.nix
  ];
}
