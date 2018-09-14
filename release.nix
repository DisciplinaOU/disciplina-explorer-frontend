{ stdenv, witnessUrl ? null, yarn, parallel, brotli }:
stdenv.mkDerivation rec {
  name = "disciplina-witness-frontend";
  src = builtins.path { path = ./.; inherit name; filter = stdenv.lib.cleanSourceFilter; };
  WITNESS_API_URL = witnessUrl;
  HOME = ".";

  buildInputs = [ yarn parallel brotli ];
  buildPhase = ''
    yarn install
    yarn build
    find dist/ -type f \
    -not -name '*.jpg' \
    -not -name '*.png' \
    -not -name '*.webp' \
    -not -name '*.woff' \
    -not -name '*.woff2' | parallel brotli
  '';

  installPhase = ''
    mv dist $out
  '';
}
