{ config, pkgs, ... }:

{

  virtualisation.docker = {
    enable = true;
    daemon.settings = {
      "live-restore" = false;
      "insecure-registries" = [ "192.168.100.5:8082" ];
    };
  };

  environment.systemPackages = with pkgs; [
    docker
    docker-compose
  ];

}
