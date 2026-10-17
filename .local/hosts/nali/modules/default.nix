{ ... }:
{
  imports = [
    ./packages.nix
    ./preferences.nix
    ./docker.nix
    ../users/eduardo
    ../packages/fish.nix
    ../desktop/compositors/niri.nix
    ../desktop/greeters/greetd.nix
    ../desktop/shells/noctalia.nix
    ../desktop/addons/vicinae.nix
    ../desktop/addons/stylix.nix
    ../packages/affinity.nix
    ../packages/squix.nix
    ../packages/zen.nix
    ../packages/neovim-nightly.nix
  ];
}
