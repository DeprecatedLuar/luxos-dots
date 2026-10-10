{ inputs, pkgs, ... }:
let
  system = pkgs.stdenv.hostPlatform.system;
  tcpeek = inputs.tcpeek.packages.${system}.default;
  blsd = inputs.borderline-lsd.packages.${system}.default;

  configDir = ./config;
  session = "graphical-session.target";
in
{
  systemd.user.services.tcpeek-yap = {
    description = "tcpeek yap state listener";
    after = [ session "blsd.service" ];
    wants = [ "blsd.service" ];
    partOf = [ session ];
    wantedBy = [ session ];
    # events run via `sh -c`; failures reported via notify-send
    path = [ blsd pkgs.bash pkgs.libnotify ];
    environment.TCPEEK_CONFIG_DIR = "${configDir}/tcpeek";
    serviceConfig = {
      ExecStart = "${tcpeek}/bin/tcpeek";
      Restart = "always";
      RestartSec = "1";
    };
  };
}
