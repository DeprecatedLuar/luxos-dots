{ ... }:

{
  networking = {
    networkmanager.enable = true;
    firewall.allowedTCPPorts = [ 80 443 ]; # caddy
  };
}
