{ ... }:

{
  networking = {
    networkmanager.enable = true;
    firewall.allowedTCPPorts = [ 80 443 8080 ];
    nameservers = [ "1.1.1.1" "9.9.9.9" ];
    networkmanager.dns = "none";
  };
}
