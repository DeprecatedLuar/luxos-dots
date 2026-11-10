{ config, lib, pkgs, ... }:

let
  nvidiaVendor = "nvidia";
  hasNvidia = builtins.any (g: g.vendor == nvidiaVendor) config.luxos.hardware.gpus;
in
{
  programs.obs-studio = {
    enable = true;
    enableVirtualCamera = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-pipewire-audio-capture # per-app audio
      obs-vkcapture              # game capture
    ];
    # Adds the driver library path to OBS binaries so NVENC can load libnvidia-encode.
    package = lib.mkIf hasNvidia (pkgs.obs-studio.override { cudaSupport = true; });
  };
}
