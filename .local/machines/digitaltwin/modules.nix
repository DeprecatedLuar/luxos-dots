{ ... }:
{
  imports = [
    ./hardware/laptop
    ./hardware/intel.nix
    ./desktop/compositors/hyprland.nix
    ./packages/lux-goodies/desktop-apps.nix
    ./packages/lux-goodies/modern-unix.nix
    ./users/offguiplay19
    ./extras.nix
    ./packages/lux-goodies/dev.nix
    ./services/docker.nix
    ./unstable.nix
    ./local/hardware-support
    ./desktop/compositors/cinnamon.nix
    ./desktop/greeters/lightdm.nix
    ./local/packages.nix
    ./packages/lux-goodies/gaming.nix
    ./services/tailscale.nix
  ];
}
