{ config, lib, pkgs, unstable, ... }:

let
  # "br-+" is an iptables wildcard; it breaks under the nftables backend
  dockerBridges = [ "docker0" "br-+" ];
  port = config.services.ollama.port;
in
{
  services.ollama = {
    enable = true;
    acceleration = "cuda";
    package = pkgs.unstable.ollama-cuda;
    host = "0.0.0.0";
  };

  networking.firewall.interfaces = lib.genAttrs dockerBridges (_: {
    allowedTCPPorts = [ port ];
  });
}
