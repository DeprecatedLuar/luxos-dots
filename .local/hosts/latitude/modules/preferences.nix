{ lib, ... }:

{
  services.xserver.xkb = {
    layout = lib.mkForce "br";
    variant = lib.mkForce "";
  };
  console.keyMap = "br-abnt2";
}
