{
  lib,
  cmake,
  stdenv,
}:
lib.fix (self:
    stdenv.mkDerivation {
      name = "in-nix";

      src = lib.fileset.toSource {
        root = ./.;
        fileset = lib.fileset.unions [
          ./in-nix.c
          ./CMakeLists.txt
        ];
      };

      nativeBuildInputs = [
        cmake
      ];

      passthru.patchNix = nix:
        nix.overrideAttrs (old: {
          postFixup =
            (old.postFixup or "")
            + ''
              patchelf --add-needed libin-nix.so $out/bin/nix
              patchelf --set-rpath "$(patchelf --print-rpath $out/bin/nix):${self}/lib" $out/bin/nix
            '';
        });
    })
