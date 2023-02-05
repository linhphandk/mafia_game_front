{ pkgs ? import <nixpkgs> {config.android_sdk.accept_license = true;} }:

(pkgs.buildFHSUserEnv {
  name = "android-sdk-env";
  targetPkgs = pkgs: (with pkgs;
let
  newFlutter = builtins.fetchTarball {
    url = "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.7.1-stable.tar.xz";
    sha256 = "NF9zC3i82tvpCWpmakG51Yj4hd2U+EUUvxC5SD0YwuU=";
  };
  in
    [
      android-studio
      newFlutter 
      git
    ]);
  runScript = "bash";
}).env

