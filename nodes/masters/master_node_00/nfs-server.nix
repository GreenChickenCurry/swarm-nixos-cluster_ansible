{ config, pkgs, ... }:

{

  fileSystems."/export/bind9" = {
    device = "/mnt/bind9";
    options = [ "bind" ];
  };

  fileSystems."/export/nginx-proxy" = {
    device = "/mnt/nginx-proxy";
    options = [ "bind" ];
  };

  fileSystems."/export/webapp" = {
    device = "/mnt/webapp";
    options = [ "bind" ];
  };

  fileSystems."/export/example" = {
    device = "/mnt/example";
    options = [ "bind" ];
  };

  services.nfs.server.enable = true;
  services.nfs.server.exports = ''
    /export                192.168.100.70(rw,fsid=0,no_subtree_check,no_root_squash) 192.168.100.80(rw,fsid=0,no_subtree_check,no_root_squash) 192.168.100.81(rw,fsid=0,no_subtree_check,no_root_squash)
    /export/bind9          192.168.100.70(rw,nohide,insecure,no_subtree_check,no_root_squash) 192.168.100.80(rw,nohide,insecure,no_subtree_check,no_root_squash) 192.168.100.81(rw,nohide,insecure,no_subtree_check,no_root_squash)
    /export/nginx-proxy    192.168.100.70(rw,nohide,insecure,no_subtree_check,no_root_squash) 192.168.100.80(rw,nohide,insecure,no_subtree_check,no_root_squash) 192.168.100.81(rw,nohide,insecure,no_subtree_check,no_root_squash)
    /export/webapp         192.168.100.70(rw,nohide,insecure,no_subtree_check,no_root_squash) 192.168.100.80(rw,nohide,insecure,no_subtree_check,no_root_squash) 192.168.100.81(rw,nohide,insecure,no_subtree_check,no_root_squash)
    /export/example        192.168.100.70(rw,nohide,insecure,no_subtree_check,no_root_squash) 192.168.100.80(rw,nohide,insecure,no_subtree_check,no_root_squash) 192.168.100.81(rw,nohide,insecure,no_subtree_check,no_root_squash)
  ''; 


}
