{ config, inputs, lib, pkgs, ... }:
let
  system = pkgs.stdenv.hostPlatform.system;
  tcpeek = inputs.tcpeek.packages.${system}.default;
  blsd = inputs.borderline-lsd.packages.${system}.default;

  configDir = ./config;
  kanataPort = 5828;
  session = "graphical-session.target";
  restartDelay = "2";

  excludeNames = lib.concatMapStringsSep " " (name: ''"${name}"'') config.vimsanity.excludeDeviceNames;

  # An empty name list is a parse error, so the line is omitted instead.
  defCfg = ''
    process-unmapped-keys yes
    log-layer-changes yes
    linux-device-detect-mode keyboard-only
    ${lib.optionalString (config.vimsanity.excludeDeviceNames != [ ]) "linux-dev-names-exclude (${excludeNames})"}
  '';

  # vimsanity.kbd uses aliases window-manager.kbd declares; order matters.
  kanataConfig =
    builtins.readFile "${configDir}/kanata/window-manager.kbd"
    + builtins.readFile "${configDir}/kanata/vimsanity.kbd";
in
{
  services.kanata = {
    enable = true;
    keyboards.vimsanity = {
      devices = config.vimsanity.devices;
      extraDefCfg = defCfg;
      config = kanataConfig;
      port = kanataPort;
    };
  };

  # The kanata module declares no restart policy.
  systemd.services.kanata-vimsanity.serviceConfig = {
    Restart = "on-failure";
    RestartSec = restartDelay;
  };

  systemd.user.services.blsd = {
    description = "blsd screen border overlay";
    after = [ session ];
    partOf = [ session ];
    wantedBy = [ session ];
    serviceConfig = {
      ExecStart = "${blsd}/bin/blsd-shell";
      Restart = "always";
      RestartSec = "1";
    };
  };

  systemd.user.services.tcpeek = {
    description = "tcpeek kanata layer listener";
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
