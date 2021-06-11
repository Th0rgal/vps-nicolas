{ pkgs, lib, config, ... }: {

  security.acme.acceptTerms = true;
  security.acme.email = "thomas.marchand@tuta.io";

  services.nginx = {
    enable = false;

    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;

    sslCiphers =
      "ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305";

    commonHttpConfig = ''
      add_header Strict-Transport-Security "max-age=63072000; includeSubDomains; preload" always;

      ssl_session_timeout 1d;
      ssl_session_cache shared:MozSSL:10m;
      ssl_session_tickets off;
      ssl_prefer_server_ciphers off;

      ssl_stapling on;
      ssl_stapling_verify on;
    '';

    virtualHosts = let
      vhost = config:
        lib.mkMerge [
          ({
            http2 = true;
            enableACME = true;
            forceSSL = true;
            extraConfig = ''
              charset UTF-8;
            '';
          })
          config
        ];
    in {
      "projet-info-maths.sexy" =
        vhost { root = "/var/www/projet-info-maths-sexy/"; };
      /* "alpha.nexmind.space" = vhost {
             locations."/" = {
                 extraConfig = ''
                     proxy_http_version 1.1;
                     proxy_set_header Host $host;
                     proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                     proxy_redirect off;
                     proxy_buffering off;
                 '';
                 proxyPass = "http://nexnode.aiohttp";
             };
         };
         "test.alpha.cash.place" = vhost {
             locations."/" = {
                 extraConfig = ''
                     proxy_http_version 1.1;
                     proxy_set_header Host $host;
                     proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                     proxy_redirect off;
                     proxy_buffering off;
                 '';
                 proxyPass = "http://cashplace.aiohttp";
             };
         };

         "golemamc.com" = vhost {
             root = "/var/www/golemamc";
             locations."/".index = "index.php";
             locations."~ \.php$".extraConfig = ''
                 # Ce qui commence par un # est inutile
                 # fastcgi_split_path_info ^(.+\.php)(/.+)$;
                 fastcgi_pass unix:${config.services.phpfpm.pools.mineweb_website.socket};
                 fastcgi_index index.php;
                 # include ${pkgs.nginx}/conf/fastcgi_params;
                 # include ${pkgs.nginx}/conf/fastcgi.conf;
             '';
         };
      */
    };
    upstreams = {
      "nexnode.aiohttp".servers."127.0.0.1:8080 fail_timeout=0" = { };
      "cashplace.aiohttp".servers."127.0.0.1:8081 fail_timeout=0" = { };
    };
  };

  /* services.phpfpm = {
         pools = let pool = poolConfig: (poolConfig // {
             settings = {
             "listen.owner" = config.services.nginx.user;
             "pm" = "dynamic";
             "pm.max_children" = 32;
             "pm.max_requests" = 500;
             "pm.start_servers" = 2;
             "pm.min_spare_servers" = 2;
             "pm.max_spare_servers" = 5;
             "php_admin_value[error_log]" = "stderr";
             "php_admin_flag[log_errors]" = true;
             "catch_workers_output" = true;
             };
             phpEnv."PATH" = lib.makeBinPath [ pkgs.php ];
         }); in {
             "mineweb_website" = pool { user = "mineweb_website"; };
         };
     };

     users.users.mineweb_website = {
         isSystemUser = true;
         createHome = true;
         home = "/var/www/golemamc";
         group  = "mineweb_website";
     };
     users.groups.mineweb_website = {};
  */

}
