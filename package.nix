{
  cmake,
  stdenv,
}:
stdenv.mkDerivation {
  name = "in-nix";

  src = ./.;

  nativeBuildInputs = [
    cmake
  ];
}
