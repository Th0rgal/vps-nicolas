{ lib, ... }: {
  services.openssh = {
    enable = true;
    ports = [ 4387 ];
    permitRootLogin = "yes";
    passwordAuthentication = true;
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
