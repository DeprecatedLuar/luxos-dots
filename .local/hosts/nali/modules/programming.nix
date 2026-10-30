{ inputs, pkgs, ... }:

{
  luxos.inputs.nixpkgs-opencode.url = "github:NixOS/nixpkgs/590d72952b052366ecf4060c8bf711d7f2b0d249";

  environment.systemPackages = with pkgs; [
    arrow-cpp
    cmake
    gnumake
    typescript
    delve
    gopls
    basedpyright
    ruff
    openjdk jdt-language-server maven gradle jdk11 jdk21 lombok
    lua-language-server
    nil
    nixpkgs-fmt
    yaml-language-server
    vscode-json-languageserver
    bash-language-server
    sqls
    oracle-instantclient
    claude-code
    fabric-ai
    kiro-cli
    distrobox
    inputs.nixpkgs-opencode.legacyPackages.${stdenv.hostPlatform.system}.opencode
  ];

  environment.sessionVariables = {
    ORACLE_HOME = "${pkgs.oracle-instantclient.lib}";
    LD_LIBRARY_PATH = [ "${pkgs.oracle-instantclient.lib}/lib" ];
    JAVA11_HOME = "${pkgs.jdk11}/lib/openjdk";
    JAVA21_HOME = "${pkgs.jdk21}/lib/openjdk";
    JDTLS_JVM_ARGS = "-javaagent:${pkgs.lombok}/share/java/lombok.jar";
  };
}
