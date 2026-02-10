{
  config,
  pkgs,
  modulesPath,
  lib,
  ...
}:
let
  userName = config.userConfiguration.name;
in
{
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-graphical-base.nix"
    ../default.nix
  ];

<<<<<<< HEAD
  home-manager.users.aliz.home.file.nixos-configuration = {
=======
  home-manager.users.${userName}.home.file.nixos-configuration = {
>>>>>>> e9d13699f687568b4028085082e95ee25e0a06dc
    source = ../.;
    target = "nixos-configuration";
  };

  isoImage.squashfsCompression = "gzip -Xcompression-level 1";
  isoImage.compressImage = false;

  # Needed for https://github.com/NixOS/nixpkgs/issues/58959
  boot.supportedFilesystems = lib.mkForce [
    "btrfs"
    "reiserfs"
    "vfat"
    "f2fs"
    "xfs"
    "ntfs"
    "cifs"
  ];
}
