{ config, pkgs, ... }:

let
  cfg = config.speedread;
  name = "speedpdf";

  speedpdf = pkgs.writeShellApplication {
    inherit name;
    runtimeInputs = [ pkgs.poppler-utils pkgs.speedread ];
    runtimeEnv = {
      SPEEDPDF_PAGE = toString cfg.page;
      SPEEDPDF_WPM = toString cfg.wpm;
      SPEEDPDF_MULTIWORD = if cfg.multiword then "1" else "";
    };
    text = builtins.readFile ./speedpdf.sh;
  };
in
{
  environment.systemPackages = [ speedpdf ];
}
