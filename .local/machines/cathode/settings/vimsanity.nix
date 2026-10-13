{
  vimsanity.devices = [
    "/dev/input/by-id/usb-BY_Tech_Gaming_Keyboard-event-kbd"
    "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
  ];
  vimsanity.excludeDeviceNames = [ ]; # Device names kanata never intercepts; only applies when devices is empty
}
