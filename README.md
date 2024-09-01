# nix-wtf-depends

because I always forget how to use nix why-depends


## usage

just run nix-wtf-depends on any output `nix build` would accept

### with flakes

```
nix run github:lassulus/nix-wtf-depends -- $some_nix_build
```

## example

```
cd ~/sync/superconfig
nix-wtf-depends .#nixosConfigurations.ignavia.config.system.build.toplevel
```
