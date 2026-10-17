{ pkgs, ... }:

let
  name = baseNameOf ../.;
in
{
  users.users.${name}.packages = with pkgs; [
    matugen
    ranger
    copyq
    kanata
    dstask
  ];
}
