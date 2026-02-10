{ pkgs, nixvim, unstable, ... }@inputs:
let
  system = "x86_64-linux";
  nixvim' = nixvim.legacyPackages.${system};
  nvim = nixvim'.makeNixvimWithModule {
    pkgs = unstable;
    module = import ./nixvim;
  };
in {
  environment.systemPackages = [ pkgs.neovide pkgs.glrnvim nvim ];
  home-manager.users.aliz = {
    programs = {
      git = {
        enable = true;
        userName = "aliz";
        userEmail = "aliz2003.2003.382@gmail.com";
        extraConfig = { init = { defaultBranch = "main"; }; };
      };
    };
  };

  environment.shellAliases.nv = "neovide --fork";
}
