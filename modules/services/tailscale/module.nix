{ config, lib, pkgs, ... }:

let
  operator = config.tailscale.operator;
  trayWatchers = [
    "org.freedesktop.StatusNotifierWatcher"
    "org.kde.StatusNotifierWatcher"
  ];
  trayWaitSeconds = 30;

  waitForTray = pkgs.writeShellScript "trayscale-wait-for-tray" ''
    for _ in $(seq ${toString trayWaitSeconds}); do
      for watcher in ${lib.escapeShellArgs trayWatchers}; do
        ${pkgs.systemd}/bin/busctl --user status "$watcher" >/dev/null 2>&1 && exit 0
      done
      sleep 1
    done
    echo "no StatusNotifierWatcher after ${toString trayWaitSeconds}s" >&2
    exit 1
  '';
in
{
  environment.systemPackages = [
    pkgs.tailscale
    pkgs.trayscale
  ];

  services.tailscale = {
    enable = true;
    extraSetFlags = [ "--accept-dns=false" ]
      ++ lib.optional (operator != null) "--operator=${operator}";
  };

  systemd.user.services.trayscale = {
    description = "Trayscale tray icon for Tailscale";
    documentation = [ "https://github.com/DeedleFake/trayscale" ];
    after = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    bindsTo = [ "graphical-session.target" ];
    wantedBy = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStartPre = waitForTray;
      ExecStart = "${pkgs.trayscale}/bin/trayscale --hide-window";
      Restart = "on-failure";
      RestartSec = "5";
    };
  };
}
