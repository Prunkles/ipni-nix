{ buildGoModule, fetchFromGitHub }:
buildGoModule rec {
  pname = "ipni-cli";
  version = "0.2.1";
  rev = "v${version}";

  src = fetchFromGitHub {
    owner = "ipni";
    repo = "ipni-cli";
    inherit rev;
    hash = "sha256-soheAcq/CZeQKtd1F3uJlOPAlA1Zq85F0zh3KTulXnU=";
  };

  vendorHash = "sha256-L8Uo2okcQpr0NsUbZ86oL7BrCCo6aupalUusN8cjnac=";
}

