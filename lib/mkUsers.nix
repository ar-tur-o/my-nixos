profiles: map (profile: {
  users.users.${profile.username} = {
    isNormalUser = true;
    inherit (profile) description;
    extraGroups = profile.groups;
    initialPassword = profile.initialPassword or "";
  };
}) profiles
