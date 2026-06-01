{
  lib,
  cfg,
}: simplePkgs: let
  sps =
    map (sp: {
      inherit (sp) name;
      description = sp.name;
      packages = lib.toList sp.value;
    })
    (lib.attrsToList simplePkgs);
in {
  options =
    builtins.listToAttrs
    (map (sp: {
        name = sp.name;
        value = {enable = lib.mkEnableOption sp.description;};
      })
      sps);

  homePackages = lib.concatMap (sp: lib.optionals cfg.${sp.name}.enable sp.packages) sps;

  bundleDefaults = namespace:
    lib.mkIf cfg.bundles.${namespace}.enable (
      builtins.listToAttrs
      (map (sp: {
          name = sp.name;
          value = {enable = lib.mkDefault true;};
        })
        sps)
    );
}
# The "simplePkgs" input should take this form:
# Note that description is nullable (optional)
# {
#   blender = [pkgs.blender];
#   godot = [pkgs.godot_4];
# }

