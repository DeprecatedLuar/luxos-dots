{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nginx
    android-tools
    btop
    rclone
    usql
    lf
    unstable.claude-code
  ];
}
