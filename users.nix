{ pkgs, ... }: {

  nix.trustedUsers = [ "root" "thomas" ];

  users.users = {

    thomas = {
      isNormalUser = true;
      home = "/home/thomas";
      extraGroups = [ "wheel" ];
      shell = pkgs.fish;
      openssh.authorizedKeys.keys = [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDcVl0JGuR8XLj2xnGhHqazghmuQWAFdxVVMOyQdYqJSp1MSWnRwQ7uaLGfBnahBzxlw92VLrcuG20rfGHH8EFy/WU7kG0BFGbjLiPtUQdN+XHu9469haJjqCm6Uol0Dj/dnM7XbQlhRal/h2iYtxZIIbPr3quSrmvqu3fZxJ5LNtlqW9J6h8aC9g3iz6nzXzZVY5c7URZQxWnBUVx4z5haHqUkSwCmUyrE6cAsWSMH9gR/8zvYg4sbh5iRRUgt1EOlgANDaKabCd6Ee5g9v54E9svoQEzD03qKgbMIV2cFc88KgfKXgEyUK6A0tEwGb2KILdIJeU/Z4bSUPqdbnDdx thoma@DESK"
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwAYNOEVX7DG9nVoe/eR2sLbOATShKFpcwEqvnYUvyqkOS8FvzRDFzc2jNsV+uJIjN2gLtw6vY6MBYHoMbpPRLKOVsKRt+2rXE6KaAXH5UXqF2Pwygt4kV8FfUwIN7m4N0wGEPlI5+TH/UDCsNtmvmSSc/XM7sprxiZ/v5RgvA8hZf6AjMYI4yzZAl/9frv8X3p4jrNkIEW6mzq1NiF93w8NLEKpuUButN/GKcS4avbAbt+l7LQfjrLgJ+zACFTm9HCIt0miy05+ovLAXuHuCgpG1ehrm7xlJOu6FhbRqcEziZ5lhp9ZP+IB8G9BZEjqU7HbZyMR3PCIex6VsRDjax thomas@horus"
      ];
    };

    root.openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDcVl0JGuR8XLj2xnGhHqazghmuQWAFdxVVMOyQdYqJSp1MSWnRwQ7uaLGfBnahBzxlw92VLrcuG20rfGHH8EFy/WU7kG0BFGbjLiPtUQdN+XHu9469haJjqCm6Uol0Dj/dnM7XbQlhRal/h2iYtxZIIbPr3quSrmvqu3fZxJ5LNtlqW9J6h8aC9g3iz6nzXzZVY5c7URZQxWnBUVx4z5haHqUkSwCmUyrE6cAsWSMH9gR/8zvYg4sbh5iRRUgt1EOlgANDaKabCd6Ee5g9v54E9svoQEzD03qKgbMIV2cFc88KgfKXgEyUK6A0tEwGb2KILdIJeU/Z4bSUPqdbnDdx thoma@DESK"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwAYNOEVX7DG9nVoe/eR2sLbOATShKFpcwEqvnYUvyqkOS8FvzRDFzc2jNsV+uJIjN2gLtw6vY6MBYHoMbpPRLKOVsKRt+2rXE6KaAXH5UXqF2Pwygt4kV8FfUwIN7m4N0wGEPlI5+TH/UDCsNtmvmSSc/XM7sprxiZ/v5RgvA8hZf6AjMYI4yzZAl/9frv8X3p4jrNkIEW6mzq1NiF93w8NLEKpuUButN/GKcS4avbAbt+l7LQfjrLgJ+zACFTm9HCIt0miy05+ovLAXuHuCgpG1ehrm7xlJOu6FhbRqcEziZ5lhp9ZP+IB8G9BZEjqU7HbZyMR3PCIex6VsRDjax thomas@horus"
    ];

  };
}
