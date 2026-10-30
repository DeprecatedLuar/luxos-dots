{ ... }:
{
  imports = [
    ./packages.nix
    ./programming.nix
    ./docker.nix
    ./networking.nix
    ../users/eduardo
    ../packages/fish.nix
    ../packages/lux-goodies/dev.nix
    ../packages/lux-goodies/modern-unix.nix
    ../desktop/compositors/niri.nix
    ../desktop/greeters/greetd.nix
    ../desktop/shells/noctalia.nix
    ../desktop/addons/vicinae.nix
    ../desktop/addons/stylix.nix
    ../packages/mpv.nix
    ../packages/obs.nix
    ../packages/antigravity.nix
    ../packages/jj-starship.nix
    ../packages/squix.nix
    ../packages/zen.nix
    ../packages/neovim-nightly.nix
  ];
}
