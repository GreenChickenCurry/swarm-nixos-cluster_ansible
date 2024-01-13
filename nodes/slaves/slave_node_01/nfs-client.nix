{ config, pkgs, ... }:

{

  fileSystems."/mnt/bind9" = {
    device = "192.168.100.70:/bind9";
    fsType = "nfs";
  };
  fileSystems."/mnt/nginx-proxy" = {
    device = "192.168.100.70:/nginx-proxy";
    fsType = "nfs";
  };
  fileSystems."/mnt/webapp" = {
    device = "192.168.100.70:/webapp";
    fsType = "nfs";
  };
  fileSystems."/mnt/example" = {
    device = "192.168.100.70:/example";
    fsType = "nfs";
  };

}
