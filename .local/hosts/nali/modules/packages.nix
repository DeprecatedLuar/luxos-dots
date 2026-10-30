{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

# GUI
    kitty
    zathura
    imv
    super-productivity
    xwayland-satellite
    wayscriber
    wl-kbptr
    adw-gtk3
    gnome-themes-extra
    papirus-icon-theme

# CLI
    btop
    tldr
    yazi
    nh
    tmux-sessionizer
    tree-sitter
    secretspec
    bc
    steam-run
    jujutsu
    nchat
    websocat
    bitwarden-cli
    yt-dlp
    spotify-player
    aerc
    ffmpeg
    chafa
    bemenu
    grim slurp swappy
    wf-recorder
  ];
}
