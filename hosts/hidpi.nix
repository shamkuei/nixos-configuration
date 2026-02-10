<<<<<<< HEAD
{ pkgs,... }:
let dpi = 250;
in {
  home-manager.users.aliz.home.pointerCursor = {
    x11.enable = true;
    package = pkgs.vanilla-dmz;
    name = "Vanilla-DMZ";
    size = 128;
  };

  services.xserver.dpi = dpi;
  home-manager.users.aliz.programs.rofi.extraConfig."dpi" = dpi;
=======
{
  config,
  pkgs,
  lib,
  ...
}:
let
  dpi = 250;
  userName = config.userConfiguration.name;
in
{
  home-manager.users.${userName}.home.pointerCursor.size = lib.mkForce 128;
>>>>>>> e9d13699f687568b4028085082e95ee25e0a06dc
  console.font = pkgs.lib.mkForce "Lat2-Terminus32";

}
