# in-nix

ELF hack that exports `IN_NIX=1` before nix starts.

When you call `nix shell`, you can use `IN_NIX` to tell your prompt that
you are under a nix shell.


## Usage

```
inputs.in-nix.packages.x86_64-linux.patchNix <your nix package>
```
