#https://nix.dev/guides/recipes/python-environment
let
  #nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-unstable"; #Use latest nixos unstable
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/94c4dbe77c0740ebba36c173672ca15a7926c993"; #Use specific SHA
  pkgs = import nixpkgs {
    config = {
      allowUnfree = true;
    };
    overlays = [];
  };
in
  pkgs.mkShellNoCC {
    packages = with pkgs; [
      (python3.withPackages (ps: [
        ps.flask
        ps.python-dotenv
        ps.requests
        ps.urllib3
        ps.werkzeug
        ps.pillow
        ps.pytz
        ps.openai
        ps.numpy
      ]))
    ];
  }
