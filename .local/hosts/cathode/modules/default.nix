{ ... }:
{
  imports = [
    ../packages/lux-goodies/gaming.nix
    ../devices/laptop
    ../desktop/compositors/hyprland.nix
#    ../desktops/xfce.nix
    ../packages/lux-goodies/desktop-apps.nix
    ../packages/lux-goodies/modern-unix.nix
    ../desktop/shells/ambxst
    ../users/luar
    ../extras.nix
    ../packages/lux-goodies/dev.nix
    ../unstable.nix
    ./packages.nix
    ./preferences.nix
    ./networking.nix
    ../vimsanity
    ../packages/yappers-of-linux
    ../services/tailscale.nix
    ../packages/sunshine
    ../desktop/compositors/cinnamon.nix
    ../desktop/greeters/ly.nix
  ];
}
