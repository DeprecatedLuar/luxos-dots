# dgpu-only: findings on this computer

ASUS TUF Dash F15 FX516PM (BIOS FX516PM.330), kernel 6.12, NVIDIA 580, Hyprland.
`dgpu-only.nix` adds the boot entry `dgpu-only`; the default entry keeps hybrid PRIME offload.

## Hardware wiring (sysfs, verified)

| GPU | PCI | Class | Connectors |
|---|---|---|---|
| Intel Tiger Lake Xe `8086:9a49` | `00:02.0` | VGA, boot VGA | eDP-1 (internal panel), HDMI-A-1, DP-1, DP-2 |
| NVIDIA RTX 3060 Laptop `10de:2520` | `01:00.0` | VGA | one HDMI (the physical HDMI port) |

- No MUX: asus-nb-wmi has no `gpu_mux_mode`, only `dgpu_disable` (turns NVIDIA off; unrelated).
- The internal panel and the boot firmware (UEFI GOP) only reach the screen through Intel.

## What dgpu-only needs (each verified by a boot)

1. `module_blacklist=i915,xe` plus `boot.blacklistedKernelModules`: Intel drivers never load.
2. `services.xserver.videoDrivers = [ "nvidia" ]`, PRIME offload off (`mkForce`, over luxos' hybrid defaults).
3. `initcall_blacklist=simpledrm_platform_driver_init`: without it the firmware framebuffer left on
   the Intel panel registers as a DRM device (`simpledrm`, card0) and Hyprland makes it the primary
   GPU; NVIDIA becomes secondary and the HDMI screen stays black while the TTY works.

Result: NVIDIA is the only DRM device, Hyprland primary, one monitor (HDMI).

## Limits

- Only the NVIDIA HDMI port works. The internal panel cannot show or mirror anything without
  `i915`; there is no route from NVIDIA to it.
- The panel keeps the last firmware/GRUB image with the backlight on: nothing drives it after boot.
  `/sys/class/backlight` is empty without `i915`, so Linux cannot switch it off.
- Firmware lights the panel before GRUB; no software setting prevents that.

## Lid

logind reports `Docked = true` while an external display is connected, so `HandleLidSwitchDocked=ignore`
(systemd/NixOS default) wins over the laptop settings' `suspend`: closing the lid does not sleep.
Unplugging the HDMI with the lid closed suspends as usual.

## Not tested

- Whether closing the lid cuts the panel backlight.
- `acpi_backlight=video` to get a backlight control without `i915`.
- A hidden GRUB menu (timeout 0) to leave a black frozen image instead of the menu.

## Notes for a luxos option

- Disabling a GPU is only safe when an enabled GPU keeps a connector; PCI class does not tell
  (both GPUs here are VGA class). Connectors come from `/sys/class/drm/card*-*`.
- It takes all three steps above, not a driver blacklist alone.
- Detection keeps seeing the Intel device (it stays on the PCI bus), so luxos' hybrid defaults
  still apply and must be overridden.
- In the default entry NVIDIA reported runtime status `active` at idle: `powerManagement.finegrained`
  is not set, so hybrid mode is not saving its power either.
