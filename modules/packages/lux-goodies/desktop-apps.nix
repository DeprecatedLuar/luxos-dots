{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kitty
    firefox brave   
    vscode-fhs
    imagemagick
    libnotify   
    adwaita-icon-theme
    adw-gtk3
    zathura
    playerctl celluloid mpv
    xfce.tumbler ffmpegthumbnailer   
    lf ranger

    # Qt theming
    darkly
    papirus-icon-theme
    kdePackages.breeze
    adwaita-qt6   

    # Wallpaper
    swaybg
    feh
  ];
}
