{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    # nativeBuildInputs is usually what you want -- tools you need to run
    nativeBuildInputs = [ 
      pkgs.buildPackages.ruby_3_2
      pkgs.buildPackages.nodejs
      pkgs.buildPackages.yarn
      pkgs.buildPackages.libyaml

      # Services
      pkgs.python3Packages.supervisor
      pkgs.buildPackages.postgresql
      
      # Kubernetes Interaction
      pkgs.buildPackages.kubectl
      pkgs.buildPackages.kubectx
      ];
    # buildInputs = [ env nodejs yarn postgresql ];

    shellHook = ''
      # Variables
      cp -n $PWD/.env.example $PWD/.env.local

      # System
      export PATH="$(yarn global bin):$PATH"
      export GEM_HOME=$PWD/.nix-gems
      export GEM_PATH=$GEM_HOME
      export PATH=$GEM_HOME/bin:$PATH
      export PATH=$PWD/bin:$PATH


      gem list -i ^bundler$ -v 2.4.22 || gem install bundler --version=2.4.22 --no-document
      bundle config set --local path vendor/bundle

      bundle install
    '';
}
