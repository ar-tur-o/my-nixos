{...}: {
  services.resolved = {
    enable = true;
    fallbackDns = [
      "45.90.28.25"
      "46.90.30.25"
      "2a07:a8c0::8d:ebdd"
      "2a07:a8c1::8d:ebdd"
    ];
  };
}
