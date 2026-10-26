{ ... }:

let
  gib = 1024 * 1024 * 1024;
  minFree = 5 * gib;
  maxFree = 20 * gib;
in
# Keeps builds from starving the desktop or filling the disk.
{
  # Builds only use CPU and disk the desktop leaves idle.
  nix.daemonCPUSchedPolicy = "idle";
  nix.daemonIOSchedClass = "idle";

  # Collect garbage mid-build when free space drops below minFree, until maxFree is free.
  nix.settings = {
    min-free = minFree;
    max-free = maxFree;
  };
}
