{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

   
   
# GUI
    rofi   
    pcmanfm-qt   
    qpwgraph
    cool-retro-term
    swayimg
    zapzap
    telegram-desktop
    hydralauncher   
    unstable.atlauncher unstable.xwayland-satellite unstable.libxkbcommon unstable.libxrender
	gparted
	krita
	unstable.noctalia
	anki
	easyeffects
	
# CLI
    whisper-cpp
    ffmpeg-headless
    scrcpy
    android-tools      
    swayidle
    nwg-wrapper
    quickshell
    libinput

# TUI
	unstable.hyprmon
    unstable.claude-code   

    # Hardware video acceleration diagnostics
    libva-utils
    v4l-utils
  ];
}
