{ pkgs ? import <nixpkgs> {config.android_sdk.accept_license = true;} }:

(pkgs.buildFHSUserEnv {
  name = "android-sdk-env";
  targetPkgs = pkgs: (with pkgs;
    [
      androidenv.androidPkgs_9_0.androidsdk
      glibc
      flutter
      dart
      android-studio
      protobuf
    ]);
  runScript = "bash";
}).env
