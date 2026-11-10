{ config, lib, ... }:

let
  cfg = config.gdm;
in
{
  services.displayManager.gdm.enable = true;

  services.displayManager.autoLogin = lib.mkIf (cfg.autoLogin != null) {
    enable = true;
    user = cfg.autoLogin;
  };
}
