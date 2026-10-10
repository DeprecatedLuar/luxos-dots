{ lib, ... }:

{
  options.vimsanity.devices = lib.mkOption {
    type = lib.types.listOf lib.types.str;
    default = [ ];
    description = "Keyboard device paths kanata intercepts; empty intercepts every detected keyboard";
  };

  options.vimsanity.excludeDeviceNames = lib.mkOption {
    type = lib.types.listOf lib.types.str;
    default = [ ];
    description = "Device names kanata never intercepts; only applies when devices is empty";
  };
}
