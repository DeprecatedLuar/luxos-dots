# Boot-menu entry "dgpu-only": Intel graphics drivers never load, NVIDIA
# drives every display it is wired to. The default entry is unchanged.
# Findings and limits: dgpu-only.md.
{ lib, ... }:

{
  specialisation.dgpu-only.configuration = {
    boot.kernelParams = [
      "module_blacklist=i915,xe"
      # The firmware framebuffer on the Intel panel would otherwise become
      # the compositor's primary GPU.
      "initcall_blacklist=simpledrm_platform_driver_init"
    ];
    boot.blacklistedKernelModules = [ "i915" "xe" ];
    services.xserver.videoDrivers = lib.mkForce [ "nvidia" ];
    hardware.nvidia.prime.offload.enable = lib.mkForce false;
    hardware.nvidia.prime.offload.enableOffloadCmd = lib.mkForce false;
  };
}
