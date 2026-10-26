{ ... }:
{
  imports = [
    ../packages/lux-goodies/gaming.nix
    ../devices/laptop
    ../desktop/compositors/hyprland.nix
#    ../desktops/xfce.nix
    ../packages/lux-goodies/desktop-apps.nix
    ../packages/lux-goodies/modern-unix.nix
    ../users/luar
    ../extras.nix
    ../packages/lux-goodies/dev.nix
    ../unstable.nix
    ./packages.nix
    ./preferences.nix
    ./networking.nix
    ../vimsanity
    ../packages/yappers-of-linux
    ../services/tailscale
    ../packages/sunshine
    ../desktop/compositors/cinnamon.nix
    ../packages/squix.nix
    ../packages/obs.nix
    ../packages/ollama.nix
    ../services/docker.nix
    ../packages/antigravity.nix
    ../desktop/greeters/ly.nix
    ../packages/gnome-boxes.nix
  ];
}
