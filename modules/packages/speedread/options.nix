{ lib, ... }:

{
  options.speedread.wpm = lib.mkOption {
    type = lib.types.ints.positive;
    default = 350;
    description = "Default reading speed in words per minute";
  };

  options.speedread.page = lib.mkOption {
    type = lib.types.ints.positive;
    default = 1;
    description = "Default PDF page to start reading from";
  };

  options.speedread.multiword = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Show short words together";
  };
}
