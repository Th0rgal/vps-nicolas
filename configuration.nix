{ pkgs, ... }: {
  require = [ ./hardware-configuration.nix ./networking.nix ./users.nix ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    cleanTmpDir = true;
  };

  # Packages
  environment.systemPackages = with pkgs; [ wget git ];

}
