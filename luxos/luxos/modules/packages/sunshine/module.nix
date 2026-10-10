{ config, ... }:

let
  webUiPort = 47990;
in
{
  services.sunshine = {
    enable = true;
    autoStart = config.sunshine.autoStart;
    capSysAdmin = true;
    openFirewall = true;
    settings.capture = "kms";
  };

  networking.firewall.allowedTCPPorts = [ webUiPort ];
}
