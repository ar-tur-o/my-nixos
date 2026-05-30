# Documentation at:
# https://nix-community.github.io/home-manager/options.xhtml#opt-programs.firefox.enable
{
  lib,
  config,
  ...
}: let
  cfg = config.myHome.firefox;
in {
  options.myHome.firefox = {
    enable = lib.mkEnableOption "Enable the Firefox browser";
  };

  config =
    lib.mkIf cfg.enable
    {
      programs.firefox = {
        enable = lib.mkDefault true;

        # Check about:policies#documentation for options.
        policies = {
          EnableTrackingProtection = {
            Value = true;
            Locked = true;
            Cryptomining = true;
            Fingerprinting = true;
            EmailTracking = true;
          };

          SearchBar = "unified";
          NoDefaultBookmarks = true;
          PasswordManagerEnabled = false;
          StartDownloadsInTempDirectory = false;

          # Firefox Suggest is the suggestions that appear when typing in the search bar.
          FirefoxSuggest = {
            WebSuggestions = true;
            SponsoredSuggestions = false;
            ImproveSuggest = false;
            Locked = true;
          };

          FirefoxHome = {
            Search = true;
            TopSites = false;
            SponsoredTopSites = false;
            Highlights = false;
            Pocket = false;
            SponsoredPocket = false;
            Snippets = false;
            Locked = true;
          };

          DisplayBookmarksToolbar = "always";
          DisableTelemetry = true;
          DisablePocket = true;
          DisableFormHistory = true;
          DisableFirefoxStudies = true;

          AutofillCreditCardEnabled = false;
          AutofillAddressEnabled = false;
        };
      };

      home.sessionVariables = {
        BROWSER = "firefox";
      };
    };
}
