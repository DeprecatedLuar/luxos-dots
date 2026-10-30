{ pkgs, ... }:

{
  environment.systemPackages = [
    (pkgs.mpv.override {
      scripts = with pkgs.mpvScripts; [
        modernz
        cut
        occivink.crop
      ];
    })
  ];
}
