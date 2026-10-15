{ ... }:
{
  imports = [
    ./packages/lux-goodies/gaming.nix
    ./devices/laptop
    ./devices/tablet.nix
    ./desktop/compositors/hyprland.nix
    ./packages/lux-goodies/desktop-apps.nix
    ./packages/lux-goodies/modern-unix.nix
    ./desktop/shells/ambxst
    ./users/luar
    ./extras.nix
    ./packages/lux-goodies/dev.nix
    ./unstable.nix
    ./local/hardware-support
    ./local/fingerprint.nix
    ./local/networking.nix
    ./local/packages.nix
    ./local/preferences.nix
    ./packages/yappers-of-linux
    ./vimsanity
    ./services/tailscale.nix
    ./desktop/shells/noctalia.nix
    ./desktop/greeters/ly.nix
  ];
}
