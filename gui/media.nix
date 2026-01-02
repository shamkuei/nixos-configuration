{ pkgs, ... }: {
  imports = [ ];
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  environment.systemPackages = with pkgs; [
    mkvtoolnix
    ffmpeg
    vlc
    popcorntime
    obs-studio
    google-chrome
    mpv
  ];
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
}
