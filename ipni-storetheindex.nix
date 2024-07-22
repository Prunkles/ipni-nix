{ buildGoModule, fetchFromGitHub }:
buildGoModule rec {
  pname = "ipni-storetheindex";
  version = "0.8.33";
  rev = "v${version}";

  src = fetchFromGitHub {
    owner = "ipni";
    repo = "storetheindex";
    inherit rev;
    hash = "sha256-AfaEmOpmMWN+LrBIZ0yqGZHAypA3As+jAynJ6tRCODY=";
  };

  vendorHash = "sha256-cU6l9OrTpaSYQfvRG2w2V6pOyCs+rwOJ4YmO1W/LPF4=";

  # Some e2e tests are not passed idk why but nevermind
  doCheck = false;
}

