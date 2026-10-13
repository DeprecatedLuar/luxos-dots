{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    unstable.noctalia

	hydralauncher
   	steam
	ranger
    rofi
    zapzap
    equibop
    whisper-cpp

    (wrapOBS {
      plugins = with obs-studio-plugins; [ obs-pipewire-audio-capture ];
    })
  ];
}
