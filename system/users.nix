{ secrets, ... }: {
  users.users.aliz = {
    hashedPassword = secrets.HASHED_PASSWORD; # aliz
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
  };
}
