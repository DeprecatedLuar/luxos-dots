{ pkgs, ... }:

{
  # luxos.users.luar.password = ./.password.age;
  users.users.luar = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "docker" "input" "uinput" "video" ];
    packages = with pkgs; [
         
      matugen
      ranger lf          
      copyq     
      kanata
      dstask
      usql
      visidata
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBfrCrs58DjL/Y2FI+9hS+0dVRglxcMfIb9aiALctrrZ luar"
    ];
  };
}
