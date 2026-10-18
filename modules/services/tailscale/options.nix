{ lib, ... }:

{
  options.tailscale.operator = lib.mkOption {
    type = lib.types.nullOr lib.types.str;
    default = null;
    description = "User allowed to operate tailscaled without sudo";
  };
}
