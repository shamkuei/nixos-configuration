<<<<<<< HEAD
{ hardware-configuration, ... }: {
  imports = [ ../default.nix hardware-configuration ];
  home-manager.users.aliz.programs.alacritty.settings.font.size = 12;
=======
{ config, hardware-configuration, ... }:
let
  userName = config.userConfiguration.name;
in
{
  imports = [
    ../default.nix
    hardware-configuration
  ];
  home-manager.users.${userName}.programs.alacritty.settings.font.size = 12;
>>>>>>> e9d13699f687568b4028085082e95ee25e0a06dc
}
