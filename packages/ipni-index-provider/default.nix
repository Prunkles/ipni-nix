{
  buildGoModule,
  fetchFromGitHub,
  callPackage,
}:
let
  ipni-index-provider =
    buildGoModule rec {
      pname = "ipni-index-provider";
      version = "0.15.5";
      rev = "v${version}";

      src = fetchFromGitHub {
        owner = "ipni";
        repo = "index-provider";
        inherit rev;
        hash = "sha256-EGYnwuW+tHSNdMhwNs5ctekmK5usd6uqDYdxbEe2oqI=";
      };

      vendorHash = "sha256-lOzXM+fnf2/m6q2mW4CbQSF7W2xl4t/KS+hKPPu5Bjw=";

      meta = {
        mainProgram = "provider";
      };
    };
in
ipni-index-provider.overrideAttrs (finalAttrs: {
  passthru = {
    ociImage = callPackage ./oci-image.nix { ipni-index-provider = ipni-index-provider.overrideAttrs finalAttrs; };
  };
})
