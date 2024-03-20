{ flake, ... }:
{
    # Configure networking
    networking.useDHCP = false;
    networking.interfaces.eth0.useDHCP = true;

    users.users.${flake.config.people.myself} = {
      name = flake.config.people.myself;
      isNormalUser = true;
      extraGroups = ["wheel"];
    };

    services.getty.autologinUser = "test";
    security.sudo.wheelNeedsPassword = false;

    # Make VM output to the terminal instead of a separate window
    virtualisation.vmVariant.virtualisation.graphics = false;

    system.stateVersion = "23.11";
}