{ lib, pkgs, luxos, ... }:
{
  imports = luxos.modules [ "x11" ];

  services.xserver.desktopManager.cinnamon.enable = true;

  services.cinnamon.apps.enable = false;

  environment.cinnamon.excludePackages = with pkgs; [
    orca
    onboard
    blueman
    mint-artwork
    mint-cursor-themes
    mint-l-icons
    mint-l-theme
    mint-themes
    mint-x-icons
    mint-y-icons
    nixos-artwork.wallpapers.simple-dark-gray
  ];

  # Mint theme defaults are exported globally and would leak into other sessions.
  environment.sessionVariables.NIX_GSETTINGS_OVERRIDES_DIR = lib.mkForce null;

  services.orca.enable = false;
  services.touchegg.enable = false;
  services.switcherooControl.enable = false;
  services.power-profiles-daemon.enable = false;
  services.gnome.gcr-ssh-agent.enable = false;
  services.gnome.evolution-data-server.enable = lib.mkForce false;
  services.colord.enable = lib.mkForce false;
}
