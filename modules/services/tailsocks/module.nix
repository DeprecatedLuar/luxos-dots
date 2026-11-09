{ config, lib, pkgs, ... }:

let
  cfg = config.tailsocks;
  name = "tailsocks";
  listenHost = "127.0.0.1";
  socksVersion = 5;
  readyWaitSeconds = 30;

  tailscale = "${pkgs.tailscale}/bin/tailscale";
  address = "${listenHost}:${toString cfg.port}";
  # %S and %t expand to $XDG_STATE_HOME and $XDG_RUNTIME_DIR in user units.
  unitSocket = "%t/${name}/tailscaled.sock";
  shellSocket = "$XDG_RUNTIME_DIR/${name}/tailscaled.sock";
  prefFlags = lib.escapeShellArgs [
    "--exit-node=${cfg.exitNode}"
    "--hostname=${cfg.hostname}"
  ];

  # Applies exit node and hostname once the node is connected.
  applyPrefs = pkgs.writeShellScript "${name}-apply-prefs" ''
    for _ in $(seq ${toString readyWaitSeconds}); do
      if ${tailscale} --socket="$1" status >/dev/null 2>&1; then
        exec ${tailscale} --socket="$1" set ${prefFlags}
      fi
      sleep 1
    done
    echo "${name} not connected after ${toString readyWaitSeconds}s; log in with:" >&2
    echo "  tailscale --socket=${shellSocket} up ${prefFlags}" >&2
    exit 1
  '';

  # Chromium treats proxy variables like all_proxy as HTTP proxies and reads
  # them before SOCKS_SERVER, so only SOCKS_SERVER is set.
  wrapper = pkgs.writeShellScriptBin name ''
    if [ "$#" -eq 0 ]; then
      echo "usage: ${name} <command> [args...]" >&2
      exit 2
    fi
    export SOCKS_SERVER=${address}
    export SOCKS_VERSION=${toString socksVersion}
    exec "$@"
  '';
in
{
  config = {
    assertions = [{
      assertion = cfg.exitNode != "";
      message = "tailsocks.exitNode must name an exit node";
    }];

    environment.systemPackages = [ wrapper ];

    systemd.user.services.${name} = {
      description = "Tailscale SOCKS5 proxy routed through an exit node";
      documentation = [ "https://tailscale.com/kb/1112/userspace-networking" ];
      wantedBy = [ "default.target" ];
      serviceConfig = {
        Type = "simple";
        StateDirectory = name;
        RuntimeDirectory = name;
        ExecStart = lib.concatStringsSep " " [
          "${pkgs.tailscale}/bin/tailscaled"
          "--tun=userspace-networking"
          "--socks5-server=${address}"
          "--statedir=%S/${name}"
          "--socket=${unitSocket}"
        ];
        # Non-fatal: a logged-out node must stay up to be logged in.
        ExecStartPost = "-${applyPrefs} ${unitSocket}";
        Restart = "on-failure";
        RestartSec = "5";
      };
    };
  };
}
