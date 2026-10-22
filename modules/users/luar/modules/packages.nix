{ pkgs, ... }:

let
  name = baseNameOf ../.;
in
{
  users.users.${name}.packages = with pkgs; [
    matugen
    ranger
    lf
    copyq
    kanata
    dstask
  ];
}
