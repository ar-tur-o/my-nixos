{
  config,
  lib,
  ...
}: {
  options.myHost.lessDistractionDns.enable = lib.mkEnableOption "Enable dns that blocks distracting sites";

  config =
    lib.mkIf config.myHost.lessDistractionDns.enable
    {
      services.resolved = {
        enable = true;
        settings.Resolve = {
          DNS = [
            "45.90.28.0#8debdd.dns.nextdns.io"
            "2a07:a8c0::#8debdd.dns.nextdns.io"
            "45.90.30.0#8debdd.dns.nextdns.io"
            "2a07:a8c1::#8debdd.dns.nextdns.io"
          ];
          DNSOverTLS = true;
        };
      };
    };
}
