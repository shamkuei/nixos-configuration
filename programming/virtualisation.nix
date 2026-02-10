{ config, ... }:
let
  userName = config.userConfiguration.name;
in
{
  virtualisation.docker.enable = true;
  virtualisation.docker.daemon.settings.registry-mirrors = [ "https://registry.docker.ir" ];

  virtualisation.docker.daemon.settings.data-root = "/var/lib/d22";
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
<<<<<<< HEAD
  home-manager.users.aliz = {
=======
  home-manager.users.${userName} = {
>>>>>>> e9d13699f687568b4028085082e95ee25e0a06dc
    dconf.settings = {
      "org/virt-manager/virt-manager/connections" = {
        autoconnect = [ "qemu:///system" ];
        uris = [ "qemu:///system" ];
      };
    };
  };
<<<<<<< HEAD
  users.users.aliz.extraGroups = [ "libvirtd" ];
=======
  users.users.${userName}.extraGroups = [ "libvirtd" ];
>>>>>>> e9d13699f687568b4028085082e95ee25e0a06dc

}
