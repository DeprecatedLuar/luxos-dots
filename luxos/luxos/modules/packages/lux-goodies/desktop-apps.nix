{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kitty
    firefox
    vscode-fhs
    imagemagick
    libnotify
    celluloid
    adwaita-icon-theme
    adw-gtk3
    zathura
    playerctl
    xfce.tumbler
    ffmpegthumbnailer

    # Qt theming
    darkly
    papirus-icon-theme
    kdePackages.breeze
    adwaita-qt6

    mpv

    # Wallpaper
    swaybg
    feh
  ];
}
