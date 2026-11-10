{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    libreoffice-fresh
    hunspellDicts.pt_BR
  ];
}
