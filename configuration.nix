{ pkgs, ... }: {
  require =
    [ ./hardware-configuration.nix ./desktop.nix ./networking.nix ./users.nix ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    cleanTmpDir = true;
  };

}
