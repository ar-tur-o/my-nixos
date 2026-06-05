{
  pkgs,
  ...
}: {
  imports = [./base.nix];

  # ========== MISC CONFIG ========== #
  # inherited hm, config, flake boilerplate
  
  services.xserver.enable = true;

  environment.systemPackages = with pkgs; [
    # Gstreamer plugins
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    gst_all_1.gst-libav
    gst_all_1.gst-vaapi
  ];

  environment.variables.GST_PLUGIN_PATH = "/run/current-system/sw/lib/gstreamer-1.0/";

  # ========== BOOT ========== #
  # inherited all

  # ========== HARDWARE ========== #
  # inherited sound
  # inherited yubikey

  # enables opengl
  hardware.graphics.enable = true;

  # bluetooth
  services.blueman.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    input = {
      General = {
        ClassicBondedOnly = false;
      };
    };
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
        ControllerMode = "bredr";
        Experimental = true;
        FastConnectable = true;
      };
      Policy = {
        AutoEnable = true;
      };
    };
  };

  # keyboard
  services.xserver.xkb = {
    variant = "";
    layout = "us";
  };

  # printing
  services = {
    # Enable CUPS to print documents.
    printing.enable = true;

    # this enables printer autodiscovery
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };


  # misc hardware
  hardware.opentabletdriver.enable = true;
  hardware.steam-hardware.enable = true;

  # ========== LOCALE & TIME ========== #
  # inherited all

  # ========== NETWORK ========== #
  # inherited all
}
