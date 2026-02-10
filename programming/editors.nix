{
  config,
  pkgs,
  nixvim,
  unstable,
  ...
}@inputs:
let
  system = "x86_64-linux";
  nixvim' = nixvim.legacyPackages.${system};
  nvim = nixvim'.makeNixvimWithModule {
    pkgs = unstable;
    module = import ./nixvim;
  };
<<<<<<< HEAD
in {
  environment.systemPackages = [ pkgs.neovide pkgs.glrnvim nvim ];
  home-manager.users.aliz = {
    programs = {
      git = {
        enable = true;
        userName = "aliz";
        userEmail = "aliz2003.2003.382@gmail.com";
        extraConfig = { init = { defaultBranch = "main"; }; };
=======
  userName = config.userConfiguration.name;
  userFullName = config.userConfiguration.fullName;
  userEmail = config.userConfiguration.email;
in
{
  environment.systemPackages = [
    pkgs.neovide
    pkgs.glrnvim
    nvim
  ];
  home-manager.users.${userName} = {
    programs = {
      git = {
        enable = true;
        settings.user.name = userFullName;
        settings.user.email = userEmail;
        settings.init = {
          defaultBranch = "main";
        };
>>>>>>> e9d13699f687568b4028085082e95ee25e0a06dc
      };
    };
  };

  environment.shellAliases.nv = "neovide --fork";
}
