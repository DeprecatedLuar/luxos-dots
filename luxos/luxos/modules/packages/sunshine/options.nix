{ lib, ... }:

{
  options.sunshine.autoStart = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Starts Sunshine with the graphical session";
  };
}
