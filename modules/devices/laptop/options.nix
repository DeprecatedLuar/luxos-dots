{ lib, ... }:

let
  profile = lib.types.enum [ "performance" "balanced" "power-saver" ];
in
{
  options.laptop.pluggedIn = lib.mkOption {
    type = profile;
    default = "balanced";
    description = "performance | balanced | power-saver";
  };

  options.laptop.onBattery = lib.mkOption {
    type = profile;
    default = "power-saver";
    description = "performance | balanced | power-saver";
  };

  options.laptop.autoSwitch = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Switches power mode if plugged in vs on battery";
  };

  options.laptop.lidSwitch = lib.mkOption {
    type = lib.types.enum [ "suspend" "hibernate" "hybrid-sleep" "suspend-then-hibernate" "sleep" "lock" "ignore" "poweroff" ];
    default = "suspend";
    description = "suspend | hibernate | hybrid-sleep | suspend-then-hibernate | sleep | lock | ignore | poweroff";
  };
}
