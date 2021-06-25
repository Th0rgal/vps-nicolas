{ lib, ... }: {
  services = {

    openssh = {
      enable = true;
      ports = [ 4387 ];
      permitRootLogin = "yes";
      passwordAuthentication = true;
    };

    xrdp = {
      enable = true;
      defaultWindowManager = "startplasma-x11";
    };

  };

  networking = {
    hostName = "athena";
    firewall = {
      enable = false;
      allowPing = true;
      allowedTCPPorts = [ 80 443 6000 25565 ];
    };
  };
}
