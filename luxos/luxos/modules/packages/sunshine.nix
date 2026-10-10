{ inputs, pkgs, ... }:
{
  services.sunshine = {
    enable = true;
    autoStart = true;
    capSysAdmin = true;
    openFirewall = true;
    settings.capture = "kms";
  };

  networking.firewall.allowedTCPPorts = [ 47990 ];
}
