{
  pkgs,
  host,
  lib,
  inputs,
  ...
}: {
  imports = [../optional];

  nixpkgs.overlays = [inputs.nur.overlays.default];

  # ========== MISC CONFIG ========== #

  nix.settings.experimental-features = ["nix-command" "flakes"]; # enables flakes :)
  services.xserver.enable = true;
  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = host.system;

  # ========== BOOT ========== #

  boot.loader.systemd-boot.enable = lib.mkDefault true;
  boot.loader.efi.canTouchEfiVariables = lib.mkDefault true;

  # ========== HARDWARE ========== #

  # sound
  services.pulseaudio.enable = false;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    audio.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  # adds support for yubikey
  services.udev.packages = [pkgs.libfido2];

  # ========== LOCALE & TIME ========== #

  time.timeZone = "America/Los_Angeles";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # ========== NETWORK ========== #

  networking.hostName = host.name;
  networking.networkmanager.enable = true;
  networking.wireless.enable = true;
  services.gvfs = {
    enable = true;
    package = pkgs.gnome.gvfs;
  };
}
