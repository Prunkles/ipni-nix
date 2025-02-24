{
  lib,
  writeShellApplication,
  dockerTools,

  # Image dependencies
  ipni-index-provider,
  busybox,
  cacert,
}:
let
  entrypoint = writeShellApplication {
    name = "ipni-index-provider-image-entrypoint";
    text = ''
      if [[ ! -f "$PROVIDER_PATH/config" ]]; then
          /bin/provider init
      fi
      exec /bin/provider "$@"
    '';
  };
in
dockerTools.buildLayeredImage {
  name = "ipni-index-provider";
  contents = [
    busybox
    cacert
    ipni-index-provider
  ];
  config = {
    Env = [
      "SSL_CERT_FILE=${cacert}/etc/ssl/certs/ca-bundle.crt"
      "PROVIDER_PATH=/data"
    ];
    Entrypoint = [ (lib.getExe entrypoint) ];
    Cmd = [ "daemon" ];
  };
}
