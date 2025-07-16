{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {
      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";
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

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh.enable = true;

      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = with pkgs;
        [ vim
          git
          wget
          curl
          awscli
          zsh
          cmake
          zip
          antidote
          atuin
          fastfetch
          sesh
          tmux
          zoxide
          fzf
          ripgrep
          eza
          neovim
          nodejs
          python3
          uv
          btop
          fd
          delta
          git-extras
          glow
          starship
          yazi
          tree-sitter
          chezmoi
          bat
          gh
          lazygit
          lazydocker
          visidata
          awscli
          ffmpeg
          navi
          ollama
          rbenv
          imagemagick
          llm
          lua
          luarocks
          tectonic
          mongodb-cli
          mongosh
          age
          sqlite-utils
          gemini-cli
          python313Packages.jupytext
          python313Packages.ipython
          python313Packages.pip
          google-cloud-sdk
          rbenv
          openssl_3
          cmatrix

        ];

    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#MacBook-Pro
    darwinConfigurations."MacBook-Pro" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };
  };
}
