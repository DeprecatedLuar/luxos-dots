{ lib, ... }:

{
  options.tailscale.operator = lib.mkOption {
    type = lib.types.nullOr lib.types.str;
    default = null;
    description = "User allowed to operate tailscaled without sudo";
  };

  options.tailscale.exitNode = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Offers this computer as an exit node for the tailnet";
  };

  options.tailscale.trayscale = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Trayscale tray icon in the graphical session";
  };
}
