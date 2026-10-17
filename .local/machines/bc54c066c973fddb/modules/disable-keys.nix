# Built-in keyboard keys mapped to "reserved" so they emit nothing.
# 0x49 (keypad 9) is reported as permanently held by the hardware.
{ ... }:

{
  services.udev.extraHwdb = ''
    evdev:atkbd:dmi:*
     KEYBOARD_KEY_49=reserved
  '';
}
