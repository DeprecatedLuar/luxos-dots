{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    go go-tools gotools golanci-lint    
    python3
    nodejs
    cargo
    rustc
    gcc
    gh
  ];
}
