{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: {
    packages.x86_64-linux.default = nixpkgs.legacyPackages.x86_64-linux.callPackage ./package.nix {};

    devShells.x86_64-linux.default = with nixpkgs.legacyPackages.x86_64-linux;
      mkShell {
        packages = [
          clang-tools
          cmake
          ninja
          neocmakelsp
          gdb
          patchelf
        ];
        hardeningDisable = ["all"];
        env = {
          CMAKE_EXPORT_COMPILE_COMMANDS = "YES";
          CMAKE_BUILD_TYPE = "Debug";
        };
      };
  };
}
