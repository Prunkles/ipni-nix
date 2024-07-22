{ buildGoModule, fetchFromGitHub }:
buildGoModule rec {
  pname = "ipni-index-provider";
  version = "0.15.4";
  rev = "v${version}";

  src = fetchFromGitHub {
    owner = "ipni";
    repo = "index-provider";
    inherit rev;
    hash = "sha256-Q/JNtw5Z3IUojg6Yewp12cxFoR2csNyO0mPK6EmmoSU=";
  };

  vendorHash = "sha256-fPDhnZNW1QF+jUiVz/ZjAxXG/kSPGBoIQ2gNbT0PrrA=";
}

