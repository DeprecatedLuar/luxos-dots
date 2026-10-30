{ luxos, ... }:
{
  imports = luxos.modules [ "wayland" ];

  programs.niri.enable = true;

  xdg.portal.config.common.default = [ "gtk" "gnome" ];
}
