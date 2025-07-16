{
  description = "RQ system flake";

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

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh = {
          enable = true;

          # oh-my-zsh = {
          #   enable = true;
          #   plugins = [
          #     "colored-man-pages"
          #     "zsh-interactive-cd"
          #     "colorize"
          #   ];
          # };
          # zplug = {
          #   enable = true;
          #   plugins = [
          #   {name = "zsh-users/zsh-autosuggestions";}
          #   {name = "zsh-users/zsh-completions";}
          #   {name = "zsh-users/zsh-history-substring-search";}
          #   {name = "zdharma-continuum/fast-syntax-highlighting";}
          #   {name = "Aloxaf/fzf-tab";}
          #   {name = "hlissner/zsh-autopair";}
          #   {name = "reegnz/jq-zsh-plugin";}
          #   {name = "mattmc3/ez-compinit";}
          #   ];
          # };
          # antidote = {
          #   enable = true;
          #   plugins = [''
          #     romkatv/zsh-defer
          #     ohmyzsh/ohmyzsh path:plugins/colorize
          #     zsh-users/zsh-history-substring-search
          #     ohmyzsh/ohmyzsh path:plugins/colored-man-pages
          #     ohmyzsh/ohmyzsh path:plugins/zsh-interactive-cd
          #     reegnz/jq-zsh-plugin
          #     hlissner/zsh-autopair
          #     Aloxaf/fzf-tab
          #     mattmc3/ez-compinit
          #     zsh-users/zsh-autosuggestions
          #     zdharma-continuum/fast-syntax-highlighting
          #     zsh-users/zsh-completions kind:fpath path:src
          #     ''
          #   ];
          # };

      };
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = with pkgs;
        [ 
          age
          antidote
          zplug
          oh-my-zsh
          atuin
          awscli
          bat
          btop
          chezmoi
          cmake
          cmatrix
          curl
          delta
          eza
          fastfetch
          fd
          ffmpeg
          fzf
          gemini-cli
          gh
          git
          git-extras
          glow
          go
          google-cloud-sdk
          imagemagick
          lazydocker
          lazygit
          llm
          lua
          luarocks
          mongodb-cli
          mongosh
          navi
          neovim
          nodejs
          ollama
          openssl_3
          python3
          python313Packages.ipython
          python313Packages.jupytext
          python313Packages.pip
          rbenv
          ripgrep
          sesh
          sqlite-utils
          sqlfluff
          starship
          tectonic
          tmux
          tree-sitter
          uv
          vim
          visidata
          wget
          yazi
          zip
          zoxide
          zsh

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
