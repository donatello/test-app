let

  fetchGitHubArchive = owner: repo: rev:
    builtins.fetchTarball "https://github.com/${owner}/${repo}/archive/${rev}.tar.gz";

  webuiDrv = nixpkgs.mkYarnPackage rec {
    name = "webui";
    src = nixpkgs.nix-gitignore.gitignoreSourcePure [ ./.gitignore ] ./. ;

    buildPhase = ''
    pushd deps/
    yarn run build
    popd
  '';

  };

  config = {
    # allowUnfree = true;
    allowBroken = true;
    packageOverrides = pkgs: rec {
      webui = webuiDrv;
    };
  };

  nixpkgs = import (builtins.fetchTarball "https://github.com/nixos/nixpkgs/archive/fb1bc1b891f.tar.gz") {
    inherit config;
  };

  projectTargets = builtins.listToAttrs (
    [ { name = "webui"; value = nixpkgs.webui; } ]
  );

in
projectTargets
