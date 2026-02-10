<<<<<<< HEAD
{ secrets, ... }: {
  users.users.aliz = {
    hashedPassword = secrets.HASHED_PASSWORD; # aliz
=======
{ config, lib, ... }:
let
  userName = config.userConfiguration.name;
  userGroups = config.userConfiguration.extraGroups;
  secrets = config.userConfiguration.secrets;
in
{
  users.users.${userName} = {
    hashedPassword = secrets.HASHED_PASSWORD;
>>>>>>> e9d13699f687568b4028085082e95ee25e0a06dc
    isNormalUser = true;
    extraGroups = userGroups;
  };
}
