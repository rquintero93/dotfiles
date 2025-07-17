{ pkgs, ... }:

with pkgs; [
          age
          libaom
          aribb24
          # arm-gcc-bin
          brotli
          giflib
          # highway
          imath
          sbclPackages.jpeg-turbo
          libjpeg_turbo
          libdeflate
          libpng
          libtiff
          libvmaf
          # little-cms2
          lz4
          # openxr-loader
          libwebp
          xz
          zstd
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

        ]

