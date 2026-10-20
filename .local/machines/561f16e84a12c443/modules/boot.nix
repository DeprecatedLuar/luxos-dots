# Boot loader for this computer, written once by luxos from the detected
# firmware and mounts. luxos never rewrites this file; edit it freely.
{ ... }:

{
  boot.loader.grub = {
    enable = true;
    configurationLimit = 4;
    device = "/dev/disk/by-id/scsi-0QEMU_QEMU_HARDDISK_100308778";
    useOSProber = true;
  };
}
