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
>>>>>>> b7f954d89a1000005689dd243794303dd0eff05d
    isNormalUser = true;
    extraGroups = userGroups;
  };
}
