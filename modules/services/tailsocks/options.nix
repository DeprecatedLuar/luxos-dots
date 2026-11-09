{ lib, ... }:

{
  options.tailsocks.exitNode = lib.mkOption {
    type = lib.types.str;
    default = "";
    description = "Exit node the proxy routes through";
  };

  options.tailsocks.port = lib.mkOption {
    type = lib.types.port;
    default = 1055;
    description = "Local SOCKS5 port, bound to 127.0.0.1";
  };

  options.tailsocks.hostname = lib.mkOption {
    type = lib.types.str;
    default = "tailsocks";
    description = "Name of the proxy's node in the tailnet";
  };
}
