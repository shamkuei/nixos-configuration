{ hardware-configuration, ... }: {
  imports = [ ../default.nix hardware-configuration ];
  home-manager.users.aliz.programs.alacritty.settings.font.size = 12;
}
