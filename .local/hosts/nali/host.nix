{ ... }:

{
  luxos.inputs.nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.xz";
  time.timeZone = "America/Sao_Paulo";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_TIME = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
  };
  services.xserver.xkb = {
    layout = "br";
    options = "caps:swapescape";
  };
  console.useXkbConfig = true;
}
