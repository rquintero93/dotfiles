{
  description = "RQ system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
    # home-manager = {
    #   url = "github:nix-community/home-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

  };

  outputs = inputs@{ self, nix-darwin, nixpkgs,  flake-utils }:
  # outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, flake-utils }:
  let
    configuration = { pkgs, ... }: {
      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Need this for Determinate NixOS builds
      nix.enable = false;

      # Allow unfree packages
      nixpkgs.config.allowUnfree = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
        
      # Declare the user that will be running `nix-darwin`.
      users.users.ricardoquintero = {
          name = "ricardoquintero";
          home = "/Users/ricardoquintero";
      };

      fonts.packages = with pkgs; [
          nerd-fonts.fira-code
          nerd-fonts.hack
          nerd-fonts.jetbrains-mono
      ];

      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = import ./packages.nix pkgs; 

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh = {
          enable = true;
      };

      # Enable Home Manager
      # home-manager = {
      #   useGlobalPkgs = true;
      #   useUserPackages = true;
      #   users.ricardoquintero = import ./home.nix;
      # };

    };
  in
  flake-utils.lib.eachSystem [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" ] (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
      commonPackages = import ./packages.nix pkgs;
    in
    if system == "aarch64-darwin" then
      {} # handled separately below
    else {
      devShells.${system}.default = pkgs.mkShell {
        name = "universal-devshell";
        packages = commonPackages;
        shellHook = ''
          echo "🚀 Entering universal devshell for ${system}"
          exec zsh
        '';
      };
    }
  ) // {
    darwinConfigurations."MacBook-Pro" = nix-darwin.lib.darwinSystem {
      modules = [
        configuration
        # home-manager.darwinModules.home-manager
      ];
    };

    devShells.aarch64-darwin.default = let
      pkgs = nixpkgs.legacyPackages.aarch64-darwin;
    in pkgs.mkShell {
      name = "global-devshell";
      packages = import ./packages.nix pkgs;
      shellHook = ''
        export STARSHIP_CONFIG=/dev/null
        echo "🍎 Entering global devshell (macOS - starship disabled)"
        exec zsh
      '';
    };
  };
}
