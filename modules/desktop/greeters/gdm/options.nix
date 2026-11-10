{ lib, ... }:
{
  options.gdm.autoLogin = lib.mkOption {
    type = lib.types.nullOr lib.types.str;
    default = null;
    description = "User logged in automatically at boot";
  };
}
