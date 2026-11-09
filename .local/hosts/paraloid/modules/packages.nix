{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

# GUI
    rofi
    audacity
    mailspring
    thunderbird
    anki
    pcmanfm-qt
    netlogo
    xournalpp
    qpwgraph
    cool-retro-term
    swayimg
    unstable.zapzap
#   equibop # idk why its broken on wayland so far
    telegram-desktop
    unstable.atlauncher
	moonlight-qt
	unstable.noctalia
    rclone

# CLI    
    megacmd
    whisper-cpp
    scrcpy
    android-tools
    wf-recorder
	wlopm
	swayidle
	unstable.lf
    unstable.hyprmon
    nwg-wrapper
    quickshell



# ???
    # Hardware video acceleration diagnostics
    libva-utils
    v4l-utils

    # RAM stability testing
    memtester
    stressapptest
  ];
}
