{ pkgs, ... }:

{
  environment.systemPackages = [ pkgs.gnome-boxes ];
  virtualisation.libvirtd.enable = true;
  services.spice-vdagentd.enable = true;
}
