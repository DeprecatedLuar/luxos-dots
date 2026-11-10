{ pkgs, luxos, ... }:
{
  imports = luxos.modules [ "desktop" ];

  services.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-user-docs
    epiphany
    geary
    yelp
  ];

  environment.systemPackages = [ pkgs.gnome-software ];
}
