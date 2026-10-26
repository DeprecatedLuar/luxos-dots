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
	
# CLI
    whisper-cpp
    scrcpy
    android-tools      
    unstable.ollama   
    swayidle
    nwg-wrapper
    quickshell

# TUI
	unstable.hyprmon
    unstable.claude-code   

    # Hardware video acceleration diagnostics
    libva-utils
    v4l-utils
  ];
}
